import express = require("express");
import {Request, Response} from "express";

import {QuranFoundationClient} from "./quranFoundationClient";
import {QueryParams} from "./quranTypes";

export const quranProxyRoutes = express();

quranProxyRoutes.use(express.json());

quranProxyRoutes.get("/chapters", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () => client().getChapters());
});

quranProxyRoutes.get("/verses/chapter/:chapterNumber", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getVersesByChapter(
      request.params.chapterNumber,
      queryFrom(request),
    ),
  );
});

quranProxyRoutes.get("/verses/page/:pageNumber", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getVersesByPage(request.params.pageNumber, queryFrom(request)),
  );
});

quranProxyRoutes.get("/verses/juz/:juzNumber", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getVersesByJuz(request.params.juzNumber, queryFrom(request)),
  );
});

quranProxyRoutes.get("/tafsir/:resourceId/:ayahKey", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getTafsir(
      request.params.resourceId,
      request.params.ayahKey,
      queryFrom(request),
    ),
  );
});

quranProxyRoutes.get("/tafsir-resources", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getTafsirResources(queryFrom(request)),
  );
});

quranProxyRoutes.get("/audio/reciters", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getReciters(queryFrom(request)),
  );
});

quranProxyRoutes.get("/audio/recitations/:reciterId", async (
  request: Request,
  response: Response,
) => {
  await handleProxy(response, () =>
    client().getRecitationMetadata(
      request.params.reciterId,
      queryFrom(request),
    ),
  );
});

function client(): QuranFoundationClient {
  return new QuranFoundationClient();
}

function queryFrom(request: Request): QueryParams {
  const query: QueryParams = {};

  for (const [key, value] of Object.entries(request.query)) {
    if (typeof value === "string") {
      query[key] = value;
    }
  }

  return query;
}

async function handleProxy(
  response: Response,
  action: () => Promise<unknown>,
): Promise<void> {
  try {
    response.status(200).json(await action());
  } catch (error) {
    const message = error instanceof Error ? error.message : "Unknown error";
    response.status(502).json({
      error: "quran_foundation_proxy_failed",
      message,
    });
  }
}
