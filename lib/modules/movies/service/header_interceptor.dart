import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:movies_app/config_env.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = "Authorization";
  static const String BEARER = "Bearer ";
  static const String V4_AUTH_HEADER =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4N2NkNGNhNDI5YzY3OWIxMTRkZTExMmVhMjQ1ZDI5MSIsInN1YiI6IjVmYjYzNmMyYjRhNTQzMDA0MTUzZTE5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CPLf6wQru0x46QQPucBpNuCuFG59ovuqEXvR2_F99S8";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest =
        request.copyWith(headers: {AUTH_HEADER: BEARER + V4_AUTH_HEADER});
    return newRequest;
  }
}
