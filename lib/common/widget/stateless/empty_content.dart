import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String text;

  const EmptyContent({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}