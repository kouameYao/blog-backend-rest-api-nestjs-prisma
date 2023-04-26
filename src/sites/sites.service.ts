import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSiteDto } from './dto/create-site.dto';
import { UpdateSiteDto } from './dto/update-site.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { PRISMA_ERROR } from 'src/utils/constants';

@Injectable()
export class SitesService {
  constructor(private prisma: PrismaService) {}

  async create(createSiteDto: CreateSiteDto) {
    try {
      return await this.prisma.site.create({
        data: createSiteDto,
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === PRISMA_ERROR.P2002) {
          throw new Error(
            `Il existe un site avec ce code: ${createSiteDto.libelle}`,
          );
        }
      }
      throw error;
    }
  }

  findAll() {
    return this.prisma.site.findMany();
  }

  async findOne(id: number) {
    const driver = await this.prisma.site.findUnique({ where: { id } });

    if (!driver) {
      throw new NotFoundException(
        `Driver not found with the specify id: ${id}`,
      );
    }

    return driver;
  }

  async update(id: number, updateSiteDto: UpdateSiteDto) {
    await this.findOne(id);

    return this.prisma.site.update({
      where: { id },
      data: updateSiteDto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);

    return this.prisma.site.delete({ where: { id } });
  }
}
