import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { DriversService } from './drivers.service';
import { CreateDriverDto } from './dto/create-driver.dto';
import { UpdateDriverDto } from './dto/update-driver.dto';
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiOkResponse,
  ApiTags,
} from '@nestjs/swagger';
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
  findAll() {
    return this.driversService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.driversService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDriverDto: UpdateDriverDto) {
    return this.driversService.update(+id, updateDriverDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.driversService.remove(+id);
  }
}
