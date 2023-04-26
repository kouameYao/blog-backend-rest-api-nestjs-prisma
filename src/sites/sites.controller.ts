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

import { SitesService } from './sites.service';
import { CreateSiteDto } from './dto/create-site.dto';
import { UpdateSiteDto } from './dto/update-site.dto';
import { SiteEntity } from './entities/site.entity';

@Controller('sites')
@ApiTags('sites')
export class SitesController {
  constructor(private readonly sitesService: SitesService) {}

  @Post()
  @ApiCreatedResponse({ type: SiteEntity })
  create(@Body() createSiteDto: CreateSiteDto) {
    return this.sitesService.create(createSiteDto);
  }

  @Get()
  @ApiOkResponse({ type: SiteEntity, isArray: true })
  async findAll() {
    const sites = await this.sitesService.findAll();
    return sites.map((site) => new SiteEntity(site));
  }

  @Get(':id')
  @ApiOkResponse({ type: SiteEntity })
  findOne(@Param('id') id: string) {
    return this.sitesService.findOne(+id);
  }

  @Patch(':id')
  @ApiCreatedResponse({ type: SiteEntity })
  update(@Param('id') id: string, @Body() updateSiteDto: UpdateSiteDto) {
    return this.sitesService.update(+id, updateSiteDto);
  }

  @Delete(':id')
  @ApiOkResponse({ type: SiteEntity })
  remove(@Param('id') id: string) {
    return this.sitesService.remove(+id);
  }
}
