import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateTruckDto } from './dto/create-truck.dto';
import { UpdateTruckDto } from './dto/update-truck.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma, Truck } from '@prisma/client';
import { PRISMA_ERROR } from 'src/utils/constants';

@Injectable()
export class TrucksService {
  constructor(private prisma: PrismaService) {}

  async create(createTruckDto: CreateTruckDto): Promise<Truck> {
    try {
      return await this.prisma.truck.create({
        data: createTruckDto,
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === PRISMA_ERROR.P2002) {
          throw new Error(
            `Le matricule: ${createTruckDto.matricule} existe déjà en base`,
          );
        }
      }
      throw error;
    }
  }

  findAll(): Promise<Truck[]> {
    return this.prisma.truck.findMany();
  }

  async findOne(id: number): Promise<Truck> {
    const truck = await this.prisma.truck.findUnique({ where: { id } });

    if (!truck) {
      throw new NotFoundException(`Truck not found with the specify id: ${id}`);
    }

    return truck;
  }

  async update(id: number, updateTruckDto: UpdateTruckDto): Promise<Truck> {
    await this.findOne(id);

    return this.prisma.truck.update({
      where: { id },
      data: updateTruckDto,
    });
  }

  async remove(id: number): Promise<Truck> {
    await this.findOne(id);

    return this.prisma.truck.delete({ where: { id } });
  }
}
