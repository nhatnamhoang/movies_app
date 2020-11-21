import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';

class BackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: AppColors.greyIcon,
          )),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
