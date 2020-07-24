import 'package:flutter_weather_app/core/model/error.dart';
import 'package:flutter_weather_app/core/service/localization/get_localization.dart';

class FailureException {
  final ErrorModel error;
  FailureException(this.error);

  @override
  String toString() {
    String e = 'An error occured';
    if (error?.code != null) {
      e = _getErrorMsg(error?.code) ??
          (error?.message ?? 'Something went wrong');
    } else {
      if (error?.message != null) {
        e = error?.message;
      }
    }
    return e;
  }
}

String _getErrorMsg(int statusCode) =>
    _errorMap.containsKey(statusCode) ? _errorMap[statusCode] : null;

Map<int, String> _errorMap = {
  51: getLocalization.noSlotMsg,
};
