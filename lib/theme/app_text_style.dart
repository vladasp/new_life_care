import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  AppTextStyle({
    required this.textColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.textLightColor,
  }) {
    tileTitleStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: 30,
      color: textColor,
    );

    tileSubtitleStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: textColor,
    );

    headerTextStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      fontSize: 25,
      color: textColor,
    );

    buttonTextStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: textLightColor,
    );

    spinnerTextStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: 40,
      color: textColor,
    );

    spinnerSecondaryTextStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: 40,
      color: secondaryTextColor,
    );

    spinnerTertiaryTextStyle = GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: 34,
      color: tertiaryTextColor,
    );
  }
  final Color? textColor;
  final Color? textLightColor;
  final Color? secondaryTextColor;
  final Color? tertiaryTextColor;

  late TextStyle tileTitleStyle;
  late TextStyle tileSubtitleStyle;

  late TextStyle headerTextStyle;
  late TextStyle buttonTextStyle;

  late TextStyle spinnerTextStyle;
  late TextStyle spinnerSecondaryTextStyle;
  late TextStyle spinnerTertiaryTextStyle;

  @override
  ThemeExtension<AppTextStyle> copyWith({
    Color? textColor,
    Color? secondaryTextColor,
    Color? tertiaryTextColor,
    Color? textLightColor,
  }) {
    return AppTextStyle(
      textColor: textColor ?? this.textColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      tertiaryTextColor: tertiaryTextColor ?? this.tertiaryTextColor,
      textLightColor: textLightColor ?? this.textLightColor,
    );
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
    ThemeExtension<AppTextStyle>? other,
    double t,
  ) {
    if (other is! AppTextStyle) {
      return this;
    }
    return AppTextStyle(
      textColor: Color.lerp(textColor, other.textColor, t),
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
      tertiaryTextColor:
          Color.lerp(tertiaryTextColor, other.tertiaryTextColor, t),
      textLightColor: Color.lerp(textLightColor, other.textLightColor, t),
    );
  }
}
