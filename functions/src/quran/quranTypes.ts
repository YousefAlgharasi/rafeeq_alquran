export type QuranFoundationEnvironment = "preproduction" | "production";

export interface QuranFoundationConfig {
  readonly environment: QuranFoundationEnvironment;
  readonly clientId: string;
  readonly clientSecret: string;
  readonly contentBaseUrl: string;
  readonly tokenUrl: string;
  readonly scope: string;
}

export interface QuranFoundationTokenResponse {
  readonly access_token: string;
  readonly token_type?: string;
  readonly expires_in?: number;
  readonly scope?: string;
}

export interface CachedAccessToken {
  readonly accessToken: string;
  readonly expiresAtMillis: number;
}

export type QueryParams = Record<string, string | number | boolean | undefined>;
