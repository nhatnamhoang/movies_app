import 'dart:async';
import 'package:movies_app/provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

enum AppState { loading, unAuthorized, authorized, anonymous }

class AppStateBloc implements BlocBase {
  final BehaviorSubject<AppState> _appState =
  BehaviorSubject<AppState>.seeded(AppState.loading);

  Stream<AppState> get appState => _appState.stream;

  AppState get appStateValue => _appState.stream.value;

  AppState get initState => AppState.loading;

  AppStateBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    changeAppState(AppState.unAuthorized);
  }

  Future<void> notifyUserLoggedSuccessfully({bool authorized = true}) async => await changeAppState(AppState.authorized);

  Future<void> changeAppState(AppState state) async {
    _appState.sink.add(state);
  }


  @override
  void dispose() {
    _appState.close();
  }
}
