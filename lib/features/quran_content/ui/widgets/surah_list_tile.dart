import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/quran_chapter.dart';

class SurahListTile extends StatelessWidget {
  const SurahListTile({
    required this.chapter,
    required this.onTap,
    super.key,
  });

  final QuranChapter chapter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(chapter.chapterNumber.toString()),
        ),
        title: Text(
          chapter.displayName(arabic: localizations.isArabic),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('${chapter.versesCount} ${localizations.verses}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
