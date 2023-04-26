import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateCommandeDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  noCmd: string;

  @IsNumber()
  @IsNotEmpty()
  @ApiProperty()
  siteId;
}
