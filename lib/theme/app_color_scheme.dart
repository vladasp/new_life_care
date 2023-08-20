import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  AppColorScheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.boxBackground,
    required this.textColor,
    required this.textLightColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
  });
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final Color? boxBackground;
  final Color? textColor;
  final Color? textLightColor;
  final Color? secondaryTextColor;
  final Color? tertiaryTextColor;

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? boxBackground,
    Color? textColor,
    Color? textLightColor,
    Color? secondaryTextColor,
    Color? tertiaryTextColor,
  }) {
    return AppColorScheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      boxBackground: boxBackground ?? this.boxBackground,
      textColor: textColor ?? this.textColor,
      textLightColor: textLightColor ?? this.textLightColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      tertiaryTextColor: tertiaryTextColor ?? this.tertiaryTextColor,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t),
      boxBackground: Color.lerp(boxBackground, other.boxBackground, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      textLightColor: Color.lerp(textLightColor, other.textLightColor, t),
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
      tertiaryTextColor:
          Color.lerp(tertiaryTextColor, other.tertiaryTextColor, t),
    );
  }
}
