import 'dart:async';
import 'package:movies_app/provider/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

enum EventName {
  createPost,
}

class BlocEvent {
  final EventName _eventName;
  final dynamic _value;

  const BlocEvent(this._eventName, [this._value]);

  EventName get name => _eventName;

  dynamic get value => _value;
}

class AppEventBloc extends BlocBase {
  // Singleton
  static final _instance = AppEventBloc._internal();

  factory AppEventBloc() => _instance;

  AppEventBloc._internal();

  final PublishSubject<BlocEvent> _eventController =
  PublishSubject<BlocEvent>();

  Function(BlocEvent) get emitEvent => _eventController.sink.add;

  StreamSubscription<BlocEvent> listenEvent({
    EventName eventName,
    Function(BlocEvent) handler,
  }) =>
      _eventController.stream
          .where((evt) => evt.name == eventName)
          .listen(handler);

  StreamSubscription<BlocEvent> listenManyEvents({
    List<EventName> listEventName,
    Function(BlocEvent) handler,
  }) =>
      _eventController.stream
          .where((evt) => listEventName.contains(evt.name))
          .listen(handler);

  @override
  void dispose() {
    _eventController.close();
  }
}
