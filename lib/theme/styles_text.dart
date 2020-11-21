import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';

class FontFamily {
  static const String sfDisplay = 'SFProText';
}

class StylesText {
  static const h4 = TextStyle(
    fontSize: 30,
    fontFamily: FontFamily.sfDisplay,
  );
  static const h5 = TextStyle(
    fontSize: 30,
    fontFamily: FontFamily.sfDisplay,
    fontWeight: FontWeight.w600,
  );
  static const h6 = TextStyle(
    fontSize: 17,
    color: Colors.white,
    fontFamily: FontFamily.sfDisplay,
  );

  static const sub1 = TextStyle(
    fontSize: 17,
    fontFamily: FontFamily.sfDisplay,
  );
  static const sub2 = TextStyle(
    fontSize: 15,
    color: AppColors.blueyGrey,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.sfDisplay,
  );
  static const body = TextStyle(
    fontSize: 15,
    fontFamily: FontFamily.sfDisplay,
  );
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.muteGrey,
    fontFamily: FontFamily.sfDisplay,
  );
  static const button = TextStyle(
    fontSize: 17,
    color: Colors.white,
    fontFamily: FontFamily.sfDisplay,
  );
}
