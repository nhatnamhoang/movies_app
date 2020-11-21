import 'package:flutter/material.dart';

class ItemSheet extends StatelessWidget {
  final String content;
  final Function onTap;
  final TextStyle textStyle;
  final bool autoPopMenu;

  const ItemSheet({
    Key key,
    @required this.content,
    this.onTap,
    this.textStyle,
    this.autoPopMenu = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (autoPopMenu) {
          Navigator.pop(context);
        }
        onTap();
      },
      child: Container(
        height: 55,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  content,
                  style: textStyle ??
                      Theme.of(context).primaryTextTheme.bodyText2,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
