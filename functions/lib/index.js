"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.quranProxy = void 0;
const app_1 = require("firebase-admin/app");
const https_1 = require("firebase-functions/v2/https");
const quranProxyRoutes_1 = require("./quran/quranProxyRoutes");
(0, app_1.initializeApp)();
exports.quranProxy = (0, https_1.onRequest)({
    cors: true,
    region: "us-central1",
}, quranProxyRoutes_1.quranProxyRoutes);
//# sourceMappingURL=index.js.map