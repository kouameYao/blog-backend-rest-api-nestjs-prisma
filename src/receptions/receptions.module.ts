import { Module } from '@nestjs/common';

import { ReceptionsService } from './receptions.service';
import { ReceptionsController } from './receptions.controller';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [ReceptionsController],
  providers: [ReceptionsService],
})
export class ReceptionsModule {}
