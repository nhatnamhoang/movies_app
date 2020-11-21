import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:movies_app/app.dart';

const String isolateName = 'call_android';

final port = ReceivePort();

SendPort uiSendPort;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient.enableTimelineLogging = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  GestureBinding.instance.resamplingEnabled = true;
  await Firebase.initializeApp();
  _setupLogging();
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
    );
  }).sendPort);



  if(Platform.isAndroid){
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      isolateName,
    );
  }

  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}