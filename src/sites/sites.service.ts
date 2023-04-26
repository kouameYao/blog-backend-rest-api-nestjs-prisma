import { Injectable, NotFoundException } from '@nestjs/common';
import { Prisma, Site } from '@prisma/client';

import { CreateSiteDto } from './dto/create-site.dto';
import { UpdateSiteDto } from './dto/update-site.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { PRISMA_ERROR } from 'src/utils/constants';

@Injectable()
export class SitesService {
  constructor(private prisma: PrismaService) {}

  async create(createSiteDto: CreateSiteDto): Promise<Site> {
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

  findAll(): Promise<Site[]> {
    return this.prisma.site.findMany();
  }

  async findOne(id: number): Promise<Site> {
    const site = await this.prisma.site.findUnique({ where: { id } });

    if (!site) {
      throw new NotFoundException(`Le site ${id} n'existe pas dans la base`);
    }

    return site;
  }

  async update(id: number, updateSiteDto: UpdateSiteDto): Promise<Site> {
    await this.findOne(id);

    return this.prisma.site.update({
      where: { id },
      data: updateSiteDto,
    });
  }

  async remove(id: number): Promise<Site> {
    await this.findOne(id);

    return this.prisma.site.delete({ where: { id } });
  }
}
