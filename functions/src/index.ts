import {initializeApp} from "firebase-admin/app";
import {onRequest} from "firebase-functions/v2/https";

import {quranProxyRoutes} from "./quran/quranProxyRoutes";

initializeApp();

export const quranProxy = onRequest(
  {
    cors: true,
    region: "us-central1",
  },
  quranProxyRoutes,
);
