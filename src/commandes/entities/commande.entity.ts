import { ApiProperty } from '@nestjs/swagger';
import { Commande } from '@prisma/client';

import { SiteEntity } from 'src/sites/entities/site.entity';

export class CommandeEntity implements Commande {
  @ApiProperty()
  id: number;

  @ApiProperty()
  noCmd: string;

  @ApiProperty()
  siteId: number;

  @ApiProperty({ required: false, type: CommandeEntity })
  site?: SiteEntity;

  @ApiProperty({ required: false, nullable: true })
  camionId: number | null;

  @ApiProperty({ required: false, type: CommandeEntity })
  camion?: CommandeEntity;

  @ApiProperty({ required: false, type: CommandeEntity })
  articles?: CommandeEntity;

  @ApiProperty({ required: false, type: CommandeEntity })
  receptions?: CommandeEntity;

  @ApiProperty()
  createdAt: Date;

  @ApiProperty()
  updatedAt: Date;

  constructor({ camion, site, ...data }: Partial<CommandeEntity>) {
    Object.assign(this, data);

    // if (camion) {
    //   this.camion = new CamionEntity(camion);
    // }

    if (site) {
      this.site = new SiteEntity(site);
    }
  }
}
