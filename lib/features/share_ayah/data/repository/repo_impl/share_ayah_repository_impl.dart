import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../logic/entity/share_ayah_content.dart';
import '../../../logic/repository/share_ayah_repository.dart';
import '../../../ui/widgets/share_ayah_image_card.dart';

class ShareAyahRepositoryImpl implements ShareAyahRepository {
  ShareAyahRepositoryImpl({
    ScreenshotController? screenshotController,
    SharePlus? sharePlus,
  }) : _screenshotController = screenshotController ?? ScreenshotController(),
       _sharePlus = sharePlus ?? SharePlus.instance;

  final ScreenshotController _screenshotController;
  final SharePlus _sharePlus;

  @override
  Future<Uint8List> generateImage({
    required BuildContext context,
    required ShareAyahContent content,
  }) {
    return _screenshotController.captureFromLongWidget(
      ShareAyahImageCard(content: content),
      context: context,
      constraints: const BoxConstraints(maxWidth: 420),
      pixelRatio: 3,
      delay: const Duration(milliseconds: 80),
    );
  }

  @override
  Future<ShareResult> shareImage({
    required BuildContext context,
    required ShareAyahContent content,
    Rect? sharePositionOrigin,
  }) async {
    final bytes = await generateImage(context: context, content: content);
    final fileName =
        'ayah_${content.verse.chapterNumber}_${content.verse.verseNumber}.png';

    return _sharePlus.share(
      ShareParams(
        title: content.verse.verseKey,
        files: [XFile.fromData(bytes, mimeType: 'image/png', name: fileName)],
        fileNameOverrides: [fileName],
        sharePositionOrigin: sharePositionOrigin,
      ),
    );
  }
}
