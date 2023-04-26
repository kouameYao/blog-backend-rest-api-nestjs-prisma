import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateArticleDto } from './dto/create-article.dto';
import { UpdateArticleDto } from './dto/update-article.dto';

@Injectable()
export class ArticlesService {
  constructor(private prisma: PrismaService) {}

  create(createArticleDto: CreateArticleDto) {
    return this.prisma.article.create({ data: createArticleDto });
  }

  findDrafts() {
    return this.prisma.article.findMany({ where: { published: false } });
  }

  findAll(draft: string) {
    const isDraft = draft === 'false' ? false : true;

    return this.prisma.article.findMany({ where: { published: isDraft } });
  }

  async findOne(id: number) {
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

  async update(id: number, updateArticleDto: UpdateArticleDto) {
    await this.findOne(id);

    return this.prisma.article.update({
      where: { id },
      data: updateArticleDto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);

    return this.prisma.article.delete({ where: { id } });
  }
}
