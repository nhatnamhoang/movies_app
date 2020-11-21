import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  final String text;

  const HeadText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.headline5,
    );
  }
}
