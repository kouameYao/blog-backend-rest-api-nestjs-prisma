import { Article } from '@prisma/client';
import { ApiProperty } from '@nestjs/swagger';

import { CommandeEntity } from 'src/commandes/entities/commande.entity';

export class ArticleEntity implements Article {
  @ApiProperty()
  id: number;

  @ApiProperty()
  poids: number;

  @ApiProperty()
  designation: string;

  @ApiProperty()
  published: boolean;

  @ApiProperty()
  createdAt: Date;

  @ApiProperty()
  updatedAt: Date;

  @ApiProperty({ required: false, nullable: true })
  commandeId: number | null;

  @ApiProperty({ required: false, type: CommandeEntity })
  commande?: CommandeEntity;

  constructor({ commande, ...data }: Partial<ArticleEntity>) {
    Object.assign(this, data);

    if (commande) {
      this.commande = new CommandeEntity(commande);
    }
  }
}
