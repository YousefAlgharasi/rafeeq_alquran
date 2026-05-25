import 'package:flutter/widgets.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/reading_goal_type.dart';

extension ReadingGoalTypeLabel on ReadingGoalType {
  String label(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return switch (this) {
      ReadingGoalType.oneAyahPerDay => localizations.oneAyahPerDay,
      ReadingGoalType.fiveAyahsPerDay => localizations.fiveAyahsPerDay,
      ReadingGoalType.onePagePerDay => localizations.onePagePerDay,
      ReadingGoalType.tenMinutesPerDay => localizations.tenMinutesPerDay,
    };
  }
}
