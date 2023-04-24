export interface Config {
  swagger: SwaggerConfig;
  security: SecurityConfig;
}

export interface SwaggerConfig {
  enabled: boolean;
  title: string;
  description: string;
  version: string;
  path: string;
}

export interface SecurityConfig {
  expiresIn: number;
  refreshIn: string;
  bcryptSaltOrRound: string | number;
}
