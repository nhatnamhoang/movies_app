import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/pages/movies_detail_page.dart';
import 'package:movies_app/modules/movies/pages/movies_page.dart';
import 'package:movies_app/utils/fade_transition.dart';
import 'package:movies_app/utils/route_name.dart';

class Routes {
  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return buildRoute(
          settings,
          MoviesPage(),
        );
      case RouteName.moviesDetailPage:
        int movie_id;
        final dynamic arguments = settings.arguments;
        if (arguments['movie_id'] is int) {
          movie_id = arguments['movie_id'];
        }
        return buildRoute(
          settings,
          MoviesDetailPage(
            movieID: movie_id
          ),
        );
      default:
        return buildRoute(settings, MoviesPage());
    }
  }

  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return buildRoute(settings, MoviesPage());
      default:
        return buildRoute(settings, MoviesPage());
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static PageRouteBuilder _buildRouteFade(
      RouteSettings settings, Widget builder) {
    return FadedTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }

  static Route profileRoute(RouteSettings settings) {
    return authorizedRoute(settings);
  }
}
