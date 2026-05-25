import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../entity/share_ayah_content.dart';

abstract class ShareAyahRepository {
  Future<Uint8List> generateImage({
    required BuildContext context,
    required ShareAyahContent content,
  });

  Future<ShareResult> shareImage({
    required BuildContext context,
    required ShareAyahContent content,
    Rect? sharePositionOrigin,
  });
}
