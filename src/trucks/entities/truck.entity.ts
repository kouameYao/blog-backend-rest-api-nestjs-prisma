import { ApiProperty } from '@nestjs/swagger';
import { Truck } from '@prisma/client';

export class TruckEntity implements Truck {
  constructor(partial: Partial<TruckEntity>) {
    Object.assign(this, partial);
  }

  @ApiProperty()
  id: number;

  @ApiProperty()
  chassi: string;

  @ApiProperty()
  marque: string;

  @ApiProperty()
  matricule: string;

  @ApiProperty()
  poids: number;

  @ApiProperty()
  type: string;

  @ApiProperty()
  createdAt: Date;

  @ApiProperty()
  updatedAt: Date;
}
