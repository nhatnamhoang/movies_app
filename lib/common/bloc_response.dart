import 'package:movies_app/common/app_errors.dart';

class BlocResponse {
  bool success;
  AppError error;

  BlocResponse({this.success, this.error});
}
