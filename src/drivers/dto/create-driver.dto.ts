import { ApiProperty } from '@nestjs/swagger';
import {
  IsNotEmpty,
  IsOptional,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class CreateDriverDto {
  @IsString()
  @IsOptional()
  @MinLength(2)
  @ApiProperty()
  nom?: string;

  @IsString()
  @IsOptional()
  @ApiProperty()
  prenoms?: string;

  @IsString()
  @IsNotEmpty()
  @MaxLength(12)
  @ApiProperty()
  cni: string;
}
