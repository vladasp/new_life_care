import 'package:flutter/material.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';

class ThemeService {
  factory ThemeService.light() {
    return ThemeService._privateConstructor(
      primaryColor: const Color(0xffFFEFEF),
      secondaryColor: const Color(0xff454581),
      tertiaryColor: const Color(0xff8d8db2),
      boxBackground: const Color(0xffF6F6F6),
      textColor: const Color(0xff000000),
      textLightColor: const Color(0xffffffff),
      secondaryTextColor: const Color(0xffCACACA),
      tertiaryTextColor: const Color(0xffF0EFEF),
    );
  }

  ThemeService._privateConstructor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.boxBackground,
    required this.textColor,
    required this.textLightColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
  });
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color boxBackground;
  final Color textColor;
  final Color textLightColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;

  ThemeData get theme {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        AppColorScheme(
          primaryColor: primaryColor,
          tertiaryColor: tertiaryColor,
          secondaryColor: secondaryColor,
          boxBackground: boxBackground,
          textColor: textColor,
          textLightColor: textLightColor,
          secondaryTextColor: secondaryTextColor,
          tertiaryTextColor: tertiaryTextColor,
        ),
        AppTextStyle(
          textColor: textColor,
          textLightColor: textLightColor,
          secondaryTextColor: secondaryTextColor,
          tertiaryTextColor: tertiaryTextColor,
        ),
      ],
      brightness: Brightness.light,
      primaryColor: primaryColor,
      canvasColor: Colors.transparent,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
