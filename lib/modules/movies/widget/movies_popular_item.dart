import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/models/popular.dart';
import 'package:movies_app/modules/movies/models/result_popular.dart';

class MoviesPopularItem extends StatelessWidget {
  final ResultPopular popular;
  final VoidCallback onTap;
  const MoviesPopularItem({this.popular, this.onTap});

  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        constraints: BoxConstraints(minWidth: 300, maxHeight: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl:  IMAGE_URL + popular.posterPath,
            fit: BoxFit.cover,
            errorWidget: (ctx, str, obj) => Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.error,
                color: Theme.of(context).canvasColor,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
