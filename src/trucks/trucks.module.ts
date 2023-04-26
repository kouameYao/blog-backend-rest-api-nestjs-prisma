import { Module } from '@nestjs/common';

import { TrucksService } from './trucks.service';
import { TrucksController } from './trucks.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [TrucksController],
  providers: [TrucksService],
})
export class TrucksModule {}
