import 'package:flutter/material.dart';
import 'package:movies_app/common/widget/stateless/card_image_movie.dart';
import 'package:movies_app/modules/movies/models/result_popular.dart';
import 'package:movies_app/theme/app_colors.dart';

class MoviesUpComingItem extends StatelessWidget {
  final ResultPopular upcoming;
  final VoidCallback onTap;
  const MoviesUpComingItem({this.upcoming, this.onTap});

  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImageMovie(
              sizeHeight: 100,
              sizeWidth: 76,
              urlImage: IMAGE_URL + upcoming.posterPath,
            ),
            const SizedBox(width: 20,),
            _buildLatestedMoviesContent(context)
          ],
        ),
      ),
    );
  }

  Widget _buildLatestedMoviesContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            upcoming.title??'',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.textDark),
          ),
          const SizedBox(height: 11,),
          Text(
            upcoming.overview??'',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.textBasicDark),
          ),
        ],
      ),
    );
  }
}
