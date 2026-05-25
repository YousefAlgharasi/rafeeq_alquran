"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.quranProxyRoutes = void 0;
const express = require("express");
const quranFoundationClient_1 = require("./quranFoundationClient");
exports.quranProxyRoutes = express();
exports.quranProxyRoutes.use(express.json());
exports.quranProxyRoutes.get("/chapters", async (request, response) => {
    await handleProxy(response, () => client().getChapters());
});
exports.quranProxyRoutes.get("/verses/chapter/:chapterNumber", async (request, response) => {
    await handleProxy(response, () => client().getVersesByChapter(request.params.chapterNumber, queryFrom(request)));
});
exports.quranProxyRoutes.get("/verses/page/:pageNumber", async (request, response) => {
    await handleProxy(response, () => client().getVersesByPage(request.params.pageNumber, queryFrom(request)));
});
exports.quranProxyRoutes.get("/verses/juz/:juzNumber", async (request, response) => {
    await handleProxy(response, () => client().getVersesByJuz(request.params.juzNumber, queryFrom(request)));
});
exports.quranProxyRoutes.get("/tafsir/:resourceId/:ayahKey", async (request, response) => {
    await handleProxy(response, () => client().getTafsir(request.params.resourceId, request.params.ayahKey, queryFrom(request)));
});
exports.quranProxyRoutes.get("/tafsir-resources", async (request, response) => {
    await handleProxy(response, () => client().getTafsirResources(queryFrom(request)));
});
exports.quranProxyRoutes.get("/audio/reciters", async (request, response) => {
    await handleProxy(response, () => client().getReciters(queryFrom(request)));
});
exports.quranProxyRoutes.get("/audio/recitations/:reciterId", async (request, response) => {
    await handleProxy(response, () => client().getRecitationMetadata(request.params.reciterId, queryFrom(request)));
});
function client() {
    return new quranFoundationClient_1.QuranFoundationClient();
}
function queryFrom(request) {
    const query = {};
    for (const [key, value] of Object.entries(request.query)) {
        if (typeof value === "string") {
            query[key] = value;
        }
    }
    return query;
}
async function handleProxy(response, action) {
    try {
        response.status(200).json(await action());
    }
    catch (error) {
        const message = error instanceof Error ? error.message : "Unknown error";
        response.status(502).json({
            error: "quran_foundation_proxy_failed",
            message,
        });
    }
}
//# sourceMappingURL=quranProxyRoutes.js.map