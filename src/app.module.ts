import { MiddlewareConsumer, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { ArticlesModule } from './articles/articles.module';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { DriversModule } from './drivers/drivers.module';
import { TrucksModule } from './trucks/trucks.module';
import { LoggerMiddleware } from './utils/middleware/logger.middleware';
import { CommandesModule } from './commandes/commandes.module';
import { SitesModule } from './sites/sites.module';
import { ReceptionsModule } from './receptions/receptions.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
      ignoreEnvFile: true,
      isGlobal: true,
    }),
    AuthModule,
    PrismaModule,
    UsersModule,
    ArticlesModule,
    DriversModule,
    TrucksModule,
    CommandesModule,
    SitesModule,
    ReceptionsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}
