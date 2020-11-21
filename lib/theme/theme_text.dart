import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/theme/styles_text.dart';

class ThemeText {
  static TextTheme textTheme = TextTheme(
    /// H1
    headline4: StylesText.h4,

    /// H2
    headline5: StylesText.h5,

    /// H3
    headline6: StylesText.h6,

    /// H4
    subtitle1: StylesText.sub1,

    subtitle2: StylesText.sub2,

    /// Body1
    bodyText1: StylesText.body,

    /// Body2
    bodyText2: StylesText.body,
    // caption
    caption: StylesText.caption,

    // Button
    button: StylesText.button,
  );

  static TextTheme primaryTextTheme = textTheme.apply(
    displayColor: AppColors.dark,
    bodyColor: AppColors.dark,
  );

  static TextTheme accentTextTheme = textTheme.copyWith().apply(
        displayColor: AppColors.basicGreen,
        bodyColor: AppColors.basicGreen,
      );
}
