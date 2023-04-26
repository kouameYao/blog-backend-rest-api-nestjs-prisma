import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsString } from 'class-validator';

export class CreateReceptionDto {
  @IsString()
  @ApiProperty()
  code: string;

  @IsNumber()
  @ApiProperty()
  commandeId: number;
}
