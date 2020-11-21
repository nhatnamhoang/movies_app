import 'package:flutter/cupertino.dart';

class AppErrors {

}

class AppError {
  final String key;
  final String message;

  const AppError({
    @required this.key,
    @required this.message,
  });

  @override
  String toString() {
    return message ?? 'Lỗi không xác định';
  }
}

class ErrorKey {
}

class ErrorLog {
  static const userIsExisted = 'user is existed';
}
