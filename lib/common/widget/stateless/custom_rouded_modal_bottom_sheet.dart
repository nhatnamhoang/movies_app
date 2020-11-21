import 'package:flutter/material.dart';

class CustomRoundedModalBottomSheet extends StatelessWidget {
  final List<Widget> children;

  const CustomRoundedModalBottomSheet({
    Key key,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 6,
              width: 57,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Theme.of(context).backgroundColor
                  //color: const Color(0xff9B9B9B),
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
