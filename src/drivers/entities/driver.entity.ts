import { ApiProperty } from '@nestjs/swagger';
import { Driver } from '@prisma/client';

export class DriverEntity implements Driver {
  constructor(partial: Partial<DriverEntity>) {
    Object.assign(this, partial);
  }

  @ApiProperty()
  id: number;

  @ApiProperty()
  nom: string;

  @ApiProperty()
  prenoms: string;

  @ApiProperty()
  cni: string;

  @ApiProperty()
  createdAt: Date;

  @ApiProperty()
  updatedAt: Date;
}
