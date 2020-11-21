import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/mixin/scroll_page_mixin.dart';
import 'package:movies_app/common/widget/stateless/circle_avatar_border.dart';
import 'package:movies_app/modules/movies/models/popular.dart';
import 'package:movies_app/modules/movies/service/movie_service.dart';
import 'package:movies_app/modules/movies/widget/movies_feature_item.dart';
import 'package:movies_app/modules/movies/widget/movies_feature_loading.dart';
import 'package:movies_app/modules/movies/widget/movies_upcoming_item.dart';
import 'package:movies_app/modules/movies/widget/movies_popular_item.dart';
import 'package:movies_app/modules/movies/widget/movies_popular_loading.dart';
import 'package:movies_app/modules/movies/widget/movies_upcoming_loading.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/utils/route_name.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final ScrollController _scrollPopularController = ScrollController();
  final ScrollController _scrollFeaturedController = ScrollController();
  final ScrollController _scrollLatestedController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: _buildCustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildListPopularMovies(context),
              _buildTitleHeadingMovies(title: 'Featured'),
              _buildListFeaturedMovies(context),
              _buildTitleHeadingMovies(title: 'Upcoming'),
              _buildListUpcomingMovies(context),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<Response> _buildListPopularMovies(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<MovieService>(context).getPopularMovies(),
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
          var popular = Popular.fromJson(mapData);
          return Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            constraints: BoxConstraints(minWidth: 350, maxHeight: 150),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollPopularController,
              itemCount: popular.results.length,
              itemBuilder: (context, index) {
                return MoviesPopularItem(
                  onTap: () => _navigateToPostDetail(popular.results[index].id),
                  popular: popular.results[index],
                );
              },
            ),
          );
        } else {
          return MoviesPopularLoading();
        }
      },
    );
  }

  FutureBuilder<Response> _buildListFeaturedMovies(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<MovieService>(context).getRateMovies(),
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
          var rate = Popular.fromJson(mapData);
          return Container(
            margin: EdgeInsets.only(left: 20),
            constraints: BoxConstraints(
                minWidth: 350,
                maxHeight: MediaQuery.of(context).size.height * 0.4),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollFeaturedController,
              itemCount: rate.results.length,
              itemBuilder: (context, index) {
                return MobileFeatureItem(
                  onTap: () => _navigateToPostDetail(rate.results[index].id),
                  rate: rate.results[index],
                );
              },
            ),
          );
        } else {
          return MoviesFeatureLoading();
        }
      },
    );
  }

  FutureBuilder<Response> _buildListUpcomingMovies(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<MovieService>(context).getUpcomingMovies(),
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
          var upcoming = Popular.fromJson(mapData);
          return Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            constraints: BoxConstraints(
                minWidth: 350,
                maxHeight: MediaQuery.of(context).size.height * 0.6),
            child: ListView.builder(
              controller: _scrollLatestedController,
              itemCount: upcoming.results.length,
              itemBuilder: (context, index) {
                return MoviesUpComingItem(
                  onTap: () =>
                      _navigateToPostDetail(upcoming.results[index].id),
                  upcoming: upcoming.results[index],
                );
              },
            ),
          );
        } else {
          return MoviesUpcomingLoading();
        }
      },
    );
  }

  Widget _buildTitleHeadingMovies({String title}) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: AppColors.textDark,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Container(
            height: 40,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.dark,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppbar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Theme.of(context).canvasColor,
      titleSpacing: 0.0,
      title: Transform(
        // you can forcefully translate values left side using Transform
        transform: Matrix4.translationValues(20.0, 0.0, 0.0),
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: AppColors.textDark,
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 12),
          child: CircleAvatarBorder(
            size: 44,
            avatarUrl: '',
          ),
        )
      ],
    );
  }

  void _navigateToPostDetail(int movie_id) {
    Navigator.of(context).pushNamed(
      RouteName.moviesDetailPage,
      arguments: {"movie_id": movie_id},
    );
  }

  @override
  void dispose() {
    _scrollPopularController?.dispose();
    _scrollFeaturedController?.dispose();
    super.dispose();
  }
}
