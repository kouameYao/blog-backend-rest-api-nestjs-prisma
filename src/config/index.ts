import { Config } from './config.interface';

export const appConfig: Config = {
  swagger: {
    enabled: true,
    title: 'CDCI-SAM',
    description: 'SAM',
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
