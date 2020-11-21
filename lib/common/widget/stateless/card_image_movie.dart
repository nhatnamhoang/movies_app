import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImageMovie extends StatelessWidget {
  final String urlImage;
  final double sizeWidth;
  final double sizeHeight;
  const CardImageMovie({this.urlImage, this.sizeWidth = 40, this.sizeHeight = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth,
      height: sizeHeight,
      child: Card(
        color: Theme.of(context).primaryColor,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          imageUrl: urlImage,
          fit: BoxFit.fill,
          errorWidget: (ctx, str, obj) => Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(
              Icons.error,
              color: Theme.of(context).canvasColor,
              size: 12,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
      ),
    );
  }
}
