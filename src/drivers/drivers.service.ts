import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateDriverDto } from './dto/create-driver.dto';
import { UpdateDriverDto } from './dto/update-driver.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { PRISMA_ERROR } from 'src/utils/constants';

@Injectable()
export class DriversService {
  constructor(private prisma: PrismaService) {}

  async create(createDriverDto: CreateDriverDto) {
    try {
      return await this.prisma.driver.create({
        data: createDriverDto,
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === PRISMA_ERROR.P2002) {
          throw new Error(
            `Il existe un chauffeur avec ce No CNI: ${createDriverDto.cni}`,
          );
        }
      }
      throw error;
    }
  }

  findAll() {
    return this.prisma.driver.findMany();
  }

  async findOne(id: number) {
    const driver = await this.prisma.driver.findUnique({ where: { id } });

    if (!driver) {
      throw new NotFoundException(
        `Driver not found with the specify id: ${id}`,
      );
    }

    return driver;
  }

  async update(id: number, updateDriverDto: UpdateDriverDto) {
    await this.findOne(id);

    return this.prisma.driver.update({
      where: { id },
      data: updateDriverDto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);

    return this.prisma.driver.delete({ where: { id } });
  }
}
