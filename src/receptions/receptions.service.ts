import { Injectable, NotFoundException } from '@nestjs/common';
import { Prisma, Reception } from '@prisma/client';

import { CreateReceptionDto } from './dto/create-reception.dto';
import { UpdateReceptionDto } from './dto/update-reception.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { PRISMA_ERROR } from 'src/utils/constants';

@Injectable()
export class ReceptionsService {
  constructor(private prisma: PrismaService) {}

  async create(createReceptionDto: CreateReceptionDto): Promise<Reception> {
    try {
      return await this.prisma.reception.create({
        data: createReceptionDto,
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === PRISMA_ERROR.P2002) {
          throw new Error(`Il existe un chauffeur avec ce No CNI`);
        }
      }
      throw error;
    }
  }

  findAll() {
    return this.prisma.reception.findMany();
  }

  async findOne(id: number): Promise<Reception> {
    const reception = await this.prisma.reception.findUnique({ where: { id } });

    if (!reception) {
      throw new NotFoundException(
        `reception not found with the specify id: ${id}`,
      );
    }

    return reception;
  }

  async update(
    id: number,
    updateReceptionDto: UpdateReceptionDto,
  ): Promise<Reception> {
    await this.findOne(id);

    return this.prisma.reception.update({
      where: { id },
      data: updateReceptionDto,
    });
  }

  async remove(id: number): Promise<Reception> {
    await this.findOne(id);

    return this.prisma.reception.delete({ where: { id } });
  }
}
