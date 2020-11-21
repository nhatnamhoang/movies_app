import 'package:flutter/material.dart';

class CircleAppBar extends StatelessWidget {
  final double size;
  CircleAppBar({this.size=13});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: MediaQuery.removePadding(
        removeBottom: true,
        context: context,
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlatButton(
              padding: const EdgeInsets.only(),
              shape: const CircleBorder(),
              color: Colors.black38,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: size,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
