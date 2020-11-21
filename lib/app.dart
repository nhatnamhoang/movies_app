import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/bloc/app_state_bloc.dart';
import 'package:movies_app/provider/bloc_provider.dart';
import 'package:movies_app/theme/themes.dart';
import 'package:movies_app/utils/routes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'modules/movies/service/movie_service.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppStateBloc _appStateBloc = AppStateBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => MovieService.create(),
        dispose: (_, MovieService service) => service.client.dispose(),
        child: OverlaySupport(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: BlocProvider(
              bloc: _appStateBloc,
              child: StreamBuilder<AppState>(
                stream: _appStateBloc.appState,
                initialData: _appStateBloc.initState,
                builder: (context, snapshot) {
                  if (snapshot.data == AppState.unAuthorized) {
                    return MaterialApp(
                      builder: _builder,
                      debugShowCheckedModeBanner: false,
                      theme: kLightTheme,
                      themeMode: ThemeMode.light,
                      navigatorKey: MyApp.navigatorKey,
                      key: const ValueKey('UnAuthorized'),
                      initialRoute: '/',
                      onGenerateRoute: Routes.unAuthorizedRoute,
                    );
                  } else if (snapshot.data == AppState.authorized) {
                    return MaterialApp(
                      key: const ValueKey('Authorized'),
                      builder: _builder,
                      debugShowCheckedModeBanner: false,
                      theme: kLightTheme,
                      themeMode: ThemeMode.light,
                      navigatorKey: MyApp.navigatorKey,
                      initialRoute: '/',
                      onGenerateRoute: Routes.authorizedRoute,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            // ),
          ),
        ));
  }

  Widget _builder(BuildContext context, Widget child) {
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: child,
    );
  }
}
