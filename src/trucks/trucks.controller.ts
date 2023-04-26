import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ParseIntPipe,
} from '@nestjs/common';
import { ApiCreatedResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';

import { TrucksService } from './trucks.service';
import { CreateTruckDto } from './dto/create-truck.dto';
import { UpdateTruckDto } from './dto/update-truck.dto';
import { TruckEntity } from './entities/truck.entity';

@Controller('trucks')
@ApiTags('trucks')
export class TrucksController {
  constructor(private readonly trucksService: TrucksService) {}

  @Post()
  @ApiCreatedResponse({ type: TruckEntity })
  async create(@Body() createTruckDto: CreateTruckDto) {
    return new TruckEntity(await this.trucksService.create(createTruckDto));
  }

  @Get()
  @ApiOkResponse({ type: TruckEntity, isArray: true })
  async findAll() {
    const users = await this.trucksService.findAll();
    return users.map((user) => new TruckEntity(user));
  }

  @Get(':id')
  @ApiOkResponse({ type: TruckEntity })
  async findOne(@Param('id', ParseIntPipe) id: string) {
    return new TruckEntity(await this.trucksService.findOne(+id));
  }

  @Patch(':id')
  @ApiCreatedResponse({ type: TruckEntity })
  async update(
    @Param('id', ParseIntPipe) id: string,
    @Body() updateTruckDto: UpdateTruckDto,
  ) {
    return new TruckEntity(
      await this.trucksService.update(+id, updateTruckDto),
    );
  }

  @Delete(':id')
  @ApiOkResponse({ type: TruckEntity })
  async remove(@Param('id', ParseIntPipe) id: string) {
    return new TruckEntity(await this.trucksService.remove(+id));
  }
}
