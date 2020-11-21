import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/theme/theme_text.dart';

import 'app_colors.dart';

final ThemeData kLightTheme = _buildLightTheme();
final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  const primaryColor = AppColors.basicGreen;
  final secondaryColor = AppColors.dark;
  const backgroundColor = AppColors.greyLight;
  const disableColor = AppColors.muteGrey;
  final InputBorder inputBorderTextField = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.0),
    borderSide: const BorderSide(color: backgroundColor),
  );

  return ThemeData(
    fontFamily: 'SFDisplay',
    platform: TargetPlatform.iOS,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    primaryColorLight: Colors.white,
    accentColor: secondaryColor,
    toggleableActiveColor: primaryColor,
    errorColor: Colors.black,
    disabledColor: disableColor,
    cursorColor: primaryColor,
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: backgroundColor,
      scaffoldBackgroundColor: Colors.white,
//      brightness: Brightness.light,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.greyDisable,
      space: 0,
      thickness: 1,
    ),
    textTheme: ThemeText.textTheme,
    primaryTextTheme: ThemeText.primaryTextTheme,
    accentTextTheme: ThemeText.accentTextTheme,
    canvasColor: Colors.white,
    backgroundColor: AppColors.greyBubble,
    scaffoldBackgroundColor: backgroundColor,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
//      height: 48,
//      textTheme: ButtonTextTheme.accent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          size: 28,
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          size: 28,
          color: Colors.white,
        ),
        color: primaryColor,
        brightness: Brightness.light),
    inputDecorationTheme: InputDecorationTheme(
      // When focus
      focusedBorder: inputBorderTextField,
      // When not focus
      enabledBorder: inputBorderTextField,
      fillColor: AppColors.greyDark,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(12),
      hintStyle: TextStyle(
        color: AppColors.muteGrey,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconTheme: const IconThemeData(
      size: 24,
    ),
    chipTheme: ChipThemeData(
      selectedColor: Colors.white,
      brightness: Brightness.light,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      labelStyle: ThemeText.primaryTextTheme.caption,
      disabledColor: AppColors.greyDisable,
      labelPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.greyBold,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      secondaryLabelStyle: ThemeText.accentTextTheme.caption,
      secondarySelectedColor: Colors.white,
      pressElevation: 0,
      elevation: 0,
      selectedShadowColor: Colors.transparent,
    ),
  );
}

ThemeData _buildDarkTheme() {
  final Color primaryColor = DarkColors.black;
  final Color secondaryColor = DarkColors.red;
  final Color disableColor = DarkColors.blackRed;
  const Brightness brightness = Brightness.dark;
  return ThemeData(
    fontFamily: 'SFProText',
    platform: TargetPlatform.iOS,
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    toggleableActiveColor: primaryColor,
    errorColor: Colors.black,
    disabledColor: disableColor,
    cursorColor: primaryColor,
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      brightness: brightness,
    ),
    dividerTheme: DividerThemeData(
      color: disableColor,
      thickness: 1,
    ),
//    textTheme: ThemeText.textTheme,
    primaryTextTheme: ThemeText.primaryTextTheme,
//    accentTextTheme: ThemeText.accentTextTheme,
    canvasColor: DarkColors.blackLight,
    scaffoldBackgroundColor: DarkColors.blackLight,
//    buttonColor: primaryColor,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      height: 48,
//      textTheme: ButtonTextTheme.accent,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
//        color: Colors.white,
        size: 28,
      ),
      actionsIconTheme: IconThemeData(
        size: 28,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    ),
  );
}
