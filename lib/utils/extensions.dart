import 'package:new_life_care/data/enums.dart';
import 'package:new_life_care/data/profile_model.dart';
import 'package:new_life_care/l10n/l10n.dart';
import 'package:new_life_care/screens/initial_screen.dart';
import 'package:new_life_care/screens/result_screen.dart';
import 'package:new_life_care/screens/select_date_screen.dart';

extension RouteExtension on ProfileModel? {
  String get initialRoute {
    if (this == null) {
      return InitialScreen.route;
    } else {
      if (this!.type == CareType.unspecified && this!.birthdayYear == null) {
        return InitialScreen.route;
      } else if (this!.type != CareType.unspecified &&
          this!.birthdayYear == null) {
        return SelectDateScreen.route;
      } else {
        return ResultScreen.route;
      }
    }
  }

  String careTypeString(AppLocalizations l10n) {
    switch (this?.type ?? CareType.unspecified) {
      case CareType.getPregnant:
        return l10n.getPregnant.toLowerCase();
      case CareType.trackPeriod:
        return l10n.trackYourPeriod;
      case CareType.unspecified:
        return '';
    }
  }
}
