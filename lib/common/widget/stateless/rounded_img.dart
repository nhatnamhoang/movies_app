import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String url;
  final double size;
  final double borderRadius;
  final bool hideThumbnail;

  const RoundedImage(
      {this.url, this.size, this.borderRadius = 6, this.hideThumbnail = false});

  @override
  Widget build(BuildContext context) {
    if (url == '' && hideThumbnail) {
      return SizedBox(width: size);
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white,
            width: hideThumbnail ? 0 : 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          errorWidget: (ctx, str, obj) => !hideThumbnail
              ? Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffd1d1d6),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).canvasColor,
                    size: size / 2,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
