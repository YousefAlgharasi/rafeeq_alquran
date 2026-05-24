import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';

class TafsirPage extends StatelessWidget {
  const TafsirPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.tafsir)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(localizations.tafsirOpenFromAyah),
        ),
      ),
    );
  }
}
