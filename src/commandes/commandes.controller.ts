import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CommandesService } from './commandes.service';
import { CreateCommandeDto } from './dto/create-commande.dto';
import { UpdateCommandeDto } from './dto/update-commande.dto';
import { ApiCreatedResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { CommandeEntity } from './entities/commande.entity';

@Controller('commandes')
@ApiTags('commandes')
export class CommandesController {
  constructor(private readonly commandesService: CommandesService) {}

  @Post()
  @ApiCreatedResponse({ type: CommandeEntity })
  async create(@Body() createCommandeDto: CreateCommandeDto) {
    return new CommandeEntity(
      await this.commandesService.create(createCommandeDto),
    );
  }

  @Get()
  @ApiOkResponse({ type: CommandeEntity })
  async findAll() {
    const commandes = await this.commandesService.findAll();
    return commandes.map((article) => new CommandeEntity(article));
  }

  @Get(':id')
  @ApiOkResponse({ type: CommandeEntity })
  async findOne(@Param('id') id: string) {
    return new CommandeEntity(await this.commandesService.findOne(+id));
  }

  @Patch(':id')
  @ApiCreatedResponse({ type: CommandeEntity })
  async update(
    @Param('id') id: string,
    @Body() updateCommandeDto: UpdateCommandeDto,
  ) {
    return new CommandeEntity(
      await this.commandesService.update(+id, updateCommandeDto),
    );
  }

  @Delete(':id')
  @ApiOkResponse({ type: CommandeEntity })
  async remove(@Param('id') id: string) {
    return new CommandeEntity(await this.commandesService.remove(+id));
  }
}
