import 'package:flutter/material.dart';

class SubheadText extends StatelessWidget {
  final String text;

  const SubheadText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.subtitle1,
    );
  }
}
