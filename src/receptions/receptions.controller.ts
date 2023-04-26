import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ApiCreatedResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';

import { ReceptionsService } from './receptions.service';
import { CreateReceptionDto } from './dto/create-reception.dto';
import { UpdateReceptionDto } from './dto/update-reception.dto';
import { ReceptionEntity } from './entities/reception.entity';

@Controller('receptions')
@ApiTags('Receptions')
export class ReceptionsController {
  constructor(private readonly receptionsService: ReceptionsService) {}

  @Post()
  @ApiCreatedResponse({ type: ReceptionEntity })
  async create(@Body() createReceptionDto: CreateReceptionDto) {
    return new ReceptionEntity(
      await this.receptionsService.create(createReceptionDto),
    );
  }

  @Get()
  @ApiOkResponse({ type: ReceptionEntity, isArray: true })
  async findAll() {
    const receptions = await this.receptionsService.findAll();
    return receptions.map((reception) => new ReceptionEntity(reception));
  }

  @Get(':id')
  @ApiOkResponse({ type: ReceptionEntity })
  async findOne(@Param('id') id: string) {
    return new ReceptionEntity(await this.receptionsService.findOne(+id));
  }

  @Patch(':id')
  @ApiCreatedResponse({ type: ReceptionEntity })
  async update(
    @Param('id') id: string,
    @Body() updateReceptionDto: UpdateReceptionDto,
  ) {
    return new ReceptionEntity(
      await this.receptionsService.update(+id, updateReceptionDto),
    );
  }

  @Delete(':id')
  @ApiOkResponse({ type: ReceptionEntity })
  async remove(@Param('id') id: string) {
    return new ReceptionEntity(await this.receptionsService.remove(+id));
  }
}
