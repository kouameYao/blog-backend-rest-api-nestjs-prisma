import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateTruckDto {
  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  matricule: string;

  @IsString()
  @IsNotEmpty()
  @ApiProperty()
  type: string;

  @IsString()
  @IsOptional()
  @ApiProperty()
  marque: string;
}
