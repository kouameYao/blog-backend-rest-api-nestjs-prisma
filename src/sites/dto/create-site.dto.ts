import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsString, MinLength } from 'class-validator';

export class CreateSiteDto {
  @IsString()
  @MinLength(2)
  @ApiProperty()
  libelle: string;

  @IsNumber()
  @MinLength(3)
  @ApiProperty()
  code: number;
}
