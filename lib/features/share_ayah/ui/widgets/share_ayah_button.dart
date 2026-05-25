import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../quran_content/logic/entity/quran_chapter.dart';
import '../../../quran_content/logic/entity/quran_verse.dart';
import '../../../quran_content/logic/provider/quran_content_provider.dart';
import '../../../tafsir/logic/entity/tafsir_entry.dart';
import '../../../tafsir/logic/provider/tafsir_provider.dart';
import '../../logic/entity/share_ayah_content.dart';
import '../../logic/provider/share_ayah_provider.dart';

class ShareAyahButton extends ConsumerStatefulWidget {
  const ShareAyahButton({
    required this.verse,
    this.tafsir,
    this.loadTafsir = true,
    super.key,
  });

  final QuranVerse verse;
  final TafsirEntry? tafsir;
  final bool loadTafsir;

  @override
  ConsumerState<ShareAyahButton> createState() => _ShareAyahButtonState();
}

class _ShareAyahButtonState extends ConsumerState<ShareAyahButton> {
  bool _isSharing = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final tafsir = widget.tafsir == null && widget.loadTafsir
        ? ref.watch(alMuyassarTafsirProvider(widget.verse.verseKey))
        : null;
    final resolvedTafsir =
        widget.tafsir ?? tafsir?.whenOrNull(data: (value) => value);

    return IconButton(
      tooltip: localizations.shareAyahAsImage,
      onPressed: _isSharing ? null : () => _share(context, resolvedTafsir),
      icon: _isSharing
          ? const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.ios_share_outlined),
    );
  }

  Future<void> _share(BuildContext context, TafsirEntry? tafsir) async {
    setState(() {
      _isSharing = true;
    });

    try {
      final box = context.findRenderObject() as RenderBox?;
      final origin = box == null
          ? null
          : box.localToGlobal(Offset.zero) & box.size;
      final localizations = AppLocalizations.of(context);
      final chapters = await _loadChapters();
      if (!mounted || !context.mounted) {
        return;
      }
      final content = ShareAyahContent(
        verse: widget.verse,
        surahName: _surahName(chapters: chapters, localizations: localizations),
        tafsir: tafsir,
      );

      await ref
          .read(shareAyahRepositoryProvider)
          .shareImage(
            context: context,
            content: content,
            sharePositionOrigin: origin,
          );
    } catch (_) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).shareAyahFailed)),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSharing = false;
        });
      }
    }
  }

  Future<List<QuranChapter>> _loadChapters() async {
    try {
      return await ref.read(quranChaptersProvider.future);
    } catch (_) {
      return const [];
    }
  }

  String _surahName({
    required List<QuranChapter>? chapters,
    required AppLocalizations localizations,
  }) {
    final chapter = chapters?.where(
      (item) => item.chapterNumber == widget.verse.chapterNumber,
    );
    final resolved = chapter == null || chapter.isEmpty
        ? null
        : chapter.first.displayName(arabic: localizations.isArabic);

    if (resolved != null && resolved.trim().isNotEmpty) {
      return resolved;
    }

    return '${localizations.surah} ${widget.verse.chapterNumber}';
  }
}
