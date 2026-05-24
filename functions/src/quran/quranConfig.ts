import {
  QuranFoundationConfig,
  QuranFoundationEnvironment,
} from "./quranTypes";

function readRequiredEnv(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) {
    throw new Error(`Missing required environment variable: ${name}`);
  }

  return value;
}

function readEnvironment(): QuranFoundationEnvironment {
  const value = process.env.QF_ENV?.trim().toLowerCase();
  if (value === "production") {
    return "production";
  }

  return "preproduction";
}

export function getQuranFoundationConfig(): QuranFoundationConfig {
  return {
    environment: readEnvironment(),
    clientId: readRequiredEnv("QF_CLIENT_ID"),
    clientSecret: readRequiredEnv("QF_CLIENT_SECRET"),
    contentBaseUrl: readRequiredEnv("QF_CONTENT_BASE_URL").replace(/\/$/, ""),
    tokenUrl: readRequiredEnv("QF_TOKEN_URL"),
    scope: process.env.QF_SCOPE?.trim() || "content",
  };
}
