import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/widget/stateless/card_image_movie.dart';
import 'package:movies_app/modules/movies/models/result_popular.dart';
import 'package:movies_app/theme/app_colors.dart';

class MobileFeatureItem extends StatelessWidget {
  final ResultPopular rate;
  final VoidCallback onTap;
  const MobileFeatureItem({this.rate, this.onTap});

  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: MediaQuery.of(context).size.width * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardImageMoviesFeature(context),
            const SizedBox(
              height: 10,
            ),
            Text(
              rate.title ?? '',
              style: Theme.of(context).textTheme.caption.copyWith(
                  color: AppColors.textDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '\$ 4.99',
              style: Theme.of(context).textTheme.caption.copyWith(
                  color: AppColors.textDark, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardImageMoviesFeature(BuildContext context) {
    return Stack(
      children: [
        CardImageMovie(
          sizeHeight: 186,
          sizeWidth: 140,
          urlImage: IMAGE_URL + rate.posterPath,
        ),
        Positioned(
            right: 15.0,
            top: 10.0,
            child: _buildRateStar(context, rate.voteAverage)),
      ],
    );
  }

  Widget _buildRateStar(BuildContext context, double number) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
            size: 10,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            number.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}
