import { ApiProperty } from '@nestjs/swagger';
import {
  IsBoolean,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';

export class CreateArticleDto {
  @IsNumber()
  @IsNotEmpty()
  @ApiProperty()
  poids: number;

  @IsString()
  @IsNotEmpty()
  @MinLength(5)
  @MaxLength(300)
  designation: string;

  @IsBoolean()
  @IsOptional()
  @ApiProperty({ required: false, default: true })
  published?: boolean = true;
}
