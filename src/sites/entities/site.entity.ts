import { ApiProperty } from '@nestjs/swagger';
import { Site } from '@prisma/client';

export class SiteEntity implements Site {
  @ApiProperty()
  id: number;

  @ApiProperty()
  code: number;

  @ApiProperty()
  libelle: string;

  constructor(data: Partial<SiteEntity>) {
    Object.assign(this, data);
  }
}
