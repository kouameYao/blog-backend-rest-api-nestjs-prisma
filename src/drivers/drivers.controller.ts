import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiTags,
} from '@nestjs/swagger';

import { DriversService } from './drivers.service';
import { CreateDriverDto } from './dto/create-driver.dto';
import { UpdateDriverDto } from './dto/update-driver.dto';
import { DriverEntity } from './entities/driver.entity';

@Controller('drivers')
@ApiTags('drivers')
export class DriversController {
  constructor(private readonly driversService: DriversService) {}

  @Post()
  @ApiCreatedResponse({ type: DriverEntity })
  async create(@Body() createDriverDto: CreateDriverDto) {
    return new DriverEntity(await this.driversService.create(createDriverDto));
  }

  @Get()
  @ApiBearerAuth()
  @ApiOkResponse({ type: DriverEntity, isArray: true })
  async findAll() {
    const drivers = await this.driversService.findAll();
    return drivers.map((driver) => new DriverEntity(driver));
  }

  @Get(':id')
  @ApiOkResponse({ type: DriverEntity })
  async findOne(@Param('id') id: string) {
    return new DriverEntity(await this.driversService.findOne(+id));
  }

  @Patch(':id')
  @ApiCreatedResponse({ type: DriverEntity })
  async update(
    @Param('id') id: string,
    @Body() updateDriverDto: UpdateDriverDto,
  ) {
    return new DriverEntity(
      await this.driversService.update(+id, updateDriverDto),
    );
  }

  @Delete(':id')
  @ApiOkResponse({ type: DriverEntity })
  async remove(@Param('id') id: string) {
    return new DriverEntity(await this.driversService.remove(+id));
  }
}
