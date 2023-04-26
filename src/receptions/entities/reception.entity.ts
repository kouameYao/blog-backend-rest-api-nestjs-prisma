import { ApiProperty } from '@nestjs/swagger';
import { Reception } from '@prisma/client';

export class ReceptionEntity implements Reception {
  constructor(partial: Partial<ReceptionEntity>) {
    Object.assign(this, partial);
  }

  @ApiProperty()
  id: number;

  @ApiProperty()
  code: string;

  @ApiProperty()
  commandeId: number;

  @ApiProperty()
  createdAt: Date;

  @ApiProperty()
  updatedAt: Date;
}
