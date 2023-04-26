import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class CommandesService {
  constructor(private prisma: PrismaService) {}

  create(createCommandeDto: CreateCommandeDto) {
    return this.prisma.commande.create({ data: createCommandeDto });
  }

  findAll() {
    return this.prisma.article.findMany();
  }

  async findOne(id: number) {
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

  async update(id: number, updateCommandeDto: UpdateCommandeDto) {
    await this.findOne(id);

    return this.prisma.commande.update({
      where: { id },
      data: updateCommandeDto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);

    return this.prisma.commande.delete({ where: { id } });
  }
}
