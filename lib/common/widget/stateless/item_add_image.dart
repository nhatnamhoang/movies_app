import 'package:flutter/material.dart';

class ItemAddImage extends StatelessWidget {
  final int index;

  const ItemAddImage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .dividerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Icon(
          Icons.add_circle,
          color: Theme
              .of(context)
              .disabledColor,
          size: 25,
        ),
      ),
    );
  }
}
