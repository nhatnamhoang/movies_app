import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleAvatarBorder extends StatelessWidget {
  final double size;
  final String avatarUrl;
  final Color colorBorder;
  final double widthBorder;
  final VoidCallback onTap;

  const CircleAvatarBorder({
    this.size = 40,
    this.avatarUrl,
    this.colorBorder,
    this.widthBorder = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorBorder ?? Colors.white,
            width: widthBorder,
          ),
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(40),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl == null || avatarUrl == ''
                ? 'https://graph.facebook.com/3293607290726429/picture?type=large&width=600&height=600'
                : avatarUrl,
            fit: BoxFit.cover,
            errorWidget: (ctx, str, obj) => Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffd1d1d6),
              ),
              child: Icon(
                Icons.person,
                color: Theme.of(context).canvasColor,
                size: size - 20,
//              color: MyColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
