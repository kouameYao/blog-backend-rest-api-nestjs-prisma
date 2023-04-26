import { Injectable, NotFoundException } from '@nestjs/common';
import { Article } from '@prisma/client';

import { PrismaService } from 'src/prisma/prisma.service';
import { CreateArticleDto } from './dto/create-article.dto';
import { UpdateArticleDto } from './dto/update-article.dto';

@Injectable()
export class ArticlesService {
  constructor(private prisma: PrismaService) {}

  create(createArticleDto: CreateArticleDto): Promise<Article> {
    return this.prisma.article.create({ data: createArticleDto });
  }

  findDrafts(): Promise<Article[]> {
    return this.prisma.article.findMany({ where: { published: false } });
  }

  findAll(draft: string): Promise<Article[]> {
    const isDraft = draft === 'false' ? false : true;

    return this.prisma.article.findMany({ where: { published: isDraft } });
  }

  async findOne(id: number): Promise<Article> {
    const article = await this.prisma.article.findUnique({
      where: { id },
      include: {
        commande: true,
      },
    });

    if (!article) {
      throw new NotFoundException(
        `Article not found with the specify id: ${id}`,
      );
    }

    return article;
  }

  async update(
    id: number,
    updateArticleDto: UpdateArticleDto,
  ): Promise<Article> {
    await this.findOne(id);

    return this.prisma.article.update({
      where: { id },
      data: updateArticleDto,
    });
  }

  async remove(id: number): Promise<Article> {
    await this.findOne(id);

    return this.prisma.article.delete({ where: { id } });
  }
}
