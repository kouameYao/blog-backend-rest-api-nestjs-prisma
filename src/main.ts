import { NestFactory, Reflector } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import {
  ClassSerializerInterceptor,
  ValidationPipe,
  Logger,
} from '@nestjs/common';
import { appConfig } from './config';
import * as dotenv from 'dotenv';

async function bootstrap() {
  const logger = new Logger('Bootstrap');
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
  app.useGlobalInterceptors(new ClassSerializerInterceptor(app.get(Reflector)));

  const config = new DocumentBuilder()
    .setTitle(appConfig.swagger.title)
    .setDescription(appConfig.swagger.description)
    .setVersion(appConfig.swagger.version)
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup(appConfig.swagger.path, app, document);

  await app.listen(process.env.PORT || 3000);

  if (process.env.NODE_ENV !== 'production') {
    logger.log('----------------------------------------------------');
    logger.log(
      `You start the project in environment: ${process.env.NODE_ENV?.toLocaleUpperCase()}`,
    );
    logger.log(
      `Project is running at: http://${process.env.APP_HOST}:${process.env.PORT}`,
    );
    logger.log('----------------------------------------------------');
  }
}
bootstrap();
