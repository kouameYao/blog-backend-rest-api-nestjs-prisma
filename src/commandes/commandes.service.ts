import { Injectable, NotFoundException } from '@nestjs/common';
import { Commande, Prisma } from '@prisma/client';

import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CommandesService {
  constructor(private prisma: PrismaService) {}

  async create(createCommandeDto: CreateCommandeDto): Promise<Commande> {
    const site = await this.prisma.site.findUnique({
      where: { id: createCommandeDto.siteId },
    });

    if (!site) {
      throw new NotFoundException(
        `Le site ${createCommandeDto.siteId} n'existe pas dans la base`,
      );
    }

    return await this.prisma.commande.create({ data: createCommandeDto });
  }

  findAll(): Promise<Commande[]> {
    return this.prisma.commande.findMany();
  }

  async findOne(id: number): Promise<Commande> {
    const commande = await this.prisma.commande.findUnique({
      where: { id },
    });

    if (!commande) {
      throw new NotFoundException(
        `commande not found with the specify id: ${id}`,
      );
    }

    return commande;
  }

  async update(
    id: number,
    updateCommandeDto: UpdateCommandeDto,
  ): Promise<Commande> {
    await this.findOne(id);

    return this.prisma.commande.update({
      where: { id },
      data: updateCommandeDto,
    });
  }

  async remove(id: number): Promise<Commande> {
    await this.findOne(id);

    return this.prisma.commande.delete({ where: { id } });
  }
}
