import {getQuranFoundationConfig} from "./quranConfig";
import {
  CachedAccessToken,
  QueryParams,
  QuranFoundationConfig,
  QuranFoundationTokenResponse,
} from "./quranTypes";

const tokenExpiryBufferMillis = 60_000;

let cachedToken: CachedAccessToken | null = null;

export class QuranFoundationClient {
  constructor(
    private readonly config: QuranFoundationConfig =
      getQuranFoundationConfig(),
  ) {}

  async getChapters(): Promise<unknown> {
    return this.getJson("/chapters");
  }

  async getVersesByChapter(
    chapterNumber: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    return this.getJson(`/verses/by_chapter/${chapterNumber}`, query);
  }

  async getVersesByPage(
    pageNumber: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    return this.getJson(`/verses/by_page/${pageNumber}`, query);
  }

  async getVersesByJuz(
    juzNumber: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    return this.getJson(`/verses/by_juz/${juzNumber}`, query);
  }

  async getTafsir(
    resourceId: string,
    ayahKey: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    return this.getJson(`/tafsirs/${resourceId}/by_ayah/${ayahKey}`, query);
  }

  async getTafsirResources(query: QueryParams = {}): Promise<unknown> {
    return this.getJson("/resources/tafsirs", query);
  }

  async getRecitationMetadata(
    reciterId: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    return this.getJson(`/recitations/${reciterId}`, query);
  }

  private async getJson(
    path: string,
    query: QueryParams = {},
  ): Promise<unknown> {
    const token = await this.getAccessToken();
    const url = new URL(`${this.config.contentBaseUrl}${path}`);

    for (const [key, value] of Object.entries(query)) {
      if (value !== undefined) {
        url.searchParams.set(key, String(value));
      }
    }

    const response = await fetch(url, {
      headers: {
        "accept": "application/json",
        "x-client-id": this.config.clientId,
        "x-auth-token": token,
      },
    });

    if (!response.ok) {
      throw new Error(
        `Quran.Foundation request failed: ${response.status}`,
      );
    }

    return response.json();
  }

  private async getAccessToken(): Promise<string> {
    const now = Date.now();
    if (cachedToken && cachedToken.expiresAtMillis > now) {
      return cachedToken.accessToken;
    }

    const body = new URLSearchParams({
      grant_type: "client_credentials",
      scope: this.config.scope,
    });

    const basicCredentials = Buffer.from(
      `${this.config.clientId}:${this.config.clientSecret}`,
    ).toString("base64");

    const response = await fetch(this.config.tokenUrl, {
      method: "POST",
      headers: {
        "authorization": `Basic ${basicCredentials}`,
        "content-type": "application/x-www-form-urlencoded",
      },
      body,
    });

    if (!response.ok) {
      throw new Error(
        `Quran.Foundation token request failed: ${response.status}`,
      );
    }

    const tokenResponse =
      (await response.json()) as QuranFoundationTokenResponse;

    if (!tokenResponse.access_token) {
      throw new Error("Quran.Foundation token response did not include a token");
    }

    const expiresInSeconds = tokenResponse.expires_in ?? 3600;
    cachedToken = {
      accessToken: tokenResponse.access_token,
      expiresAtMillis:
        now + expiresInSeconds * 1000 - tokenExpiryBufferMillis,
    };

    return cachedToken.accessToken;
  }
}
