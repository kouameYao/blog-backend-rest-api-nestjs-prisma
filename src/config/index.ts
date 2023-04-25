import { Config } from './config.interface';
import * as dotenv from 'dotenv';

export const appConfig: Config = {
  swagger: {
    enabled: true,
    title: 'Cout de transport',
    description:
      'Avoir la valeur des coûts de transport par site et par camion',
    version: '1.0',
    path: 'api/docs',
  },
  security: {
    expiresIn: 3600,
    refreshIn: '7d',
    bcryptSaltOrRound: 10,
  },
};

export const JWT_CONFIG = {
  global: true,
  secret: process.env.JWT_SECRET,
  signOptions: { expiresIn: appConfig.security.expiresIn },
};
