import 'package:flutter_weather_app/core/model/error.dart';

class FailureException {
  final ErrorModel error;
  FailureException(this.error);

  @override
  String toString() {
    String e = 'An error occured';
    if (error?.message != null) {
      e = error?.message;
    }
    return e;
  }
}

class InternetException {
  @override
  String toString() {
    return 'No internet';
  }
}
