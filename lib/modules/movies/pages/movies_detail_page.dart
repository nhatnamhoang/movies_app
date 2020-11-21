import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/widget/stateless/back_icon.dart';
import 'package:movies_app/common/widget/stateless/card_image_movie.dart';
import 'package:movies_app/modules/movies/models/movie_detail.dart';
import 'package:movies_app/modules/movies/service/movie_service.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MoviesDetailPage extends StatefulWidget {
  final int movieID;
  const MoviesDetailPage({this.movieID});

  @override
  _MoviesDetailPageState createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  int get movieId => widget.movieID;
  double screenHeight;
  double screenWidth;

  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return _buildMovieDetailBody(context);
  }

  FutureBuilder<Response> _buildMovieDetailBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<MovieService>(context).getDetailMovie(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final Map mapData = json.decode(snapshot.data.bodyString);
          var movie = MovieDetail.fromJson(mapData);
          return Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    _buildBackgroundHeader(movie),
                    _buildBackIcon(),
                    _buildIconsRight(),
                    _buildBody(movie)
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildBackgroundHeader(MovieDetail movieDetail) {
    return new Container(
      height: screenHeight,
      decoration: new BoxDecoration(
        color: AppColors.greyBackground,
        image: new DecorationImage(
          fit: BoxFit.fill,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: new NetworkImage(
            movieDetail.posterPath != null
                ? IMAGE_URL + movieDetail.posterPath
                : 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png',
          ),
        ),
      ),
    );
  }

  Widget _buildBackIcon() {
    return Padding(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
      ),
      child: BackIcon(),
    );
  }

  Widget _buildIconsRight() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
                margin: EdgeInsets.only(
                  top: 40,
                  right: 20,
                ),
                child: Icon(
                  Icons.link,
                  color: AppColors.greyIcon,
                  size: 25,
                )),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          GestureDetector(
            child: Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                child: Icon(
                  Icons.bookmark_border,
                  color: AppColors.greyIcon,
                  size: 25,
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCardImageMovie(MovieDetail movieDetail) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          CardImageMovie(
            urlImage:
            movieDetail.posterPath != null
                ? IMAGE_URL + movieDetail.posterPath
                : 'https://developers.google.com/maps/documentation/streetview/images/error-image-generic.png',
            sizeWidth: 160,
            sizeHeight: 240,
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            movieDetail.title??'Chưa có dữ liệu',
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: AppColors.greyTitle,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Sarah Perez',
            style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 13,
                color: AppColors.greyIcon,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.star,
                size: 13,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.star,
                size: 13,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.star,
                size: 13,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.star,
                size: 13,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.star_half,
                size: 13,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody(MovieDetail movieDetail) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_buildCardImageMovie(movieDetail), _buildOverviewContent(movieDetail)],
        ),
      ),
    );
  }

  Widget _buildOverviewContent(MovieDetail movieDetail) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.4),
      color: AppColors.greyContent,
      padding: EdgeInsets.only(
        top: 27,
        right: 20,
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Introduction",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: AppColors.greyTitle,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Row(
            children: [
              Container(
                height: 16,
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Audio introduction',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.greyTitle),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movieDetail.overview??'Has your life been living in the expectations of others?',
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w500, color: AppColors.greyIcon),
          ),
          const SizedBox(
            height: 44,
          ),
          _buildButtonBuy(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonBuy() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: () {},
        child: Text("Free".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
