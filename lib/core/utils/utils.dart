import 'package:intl/intl.dart';

bool isSameDay(DateTime dt1, DateTime dt2) {
  return dt1.year == dt2.year && dt1.month == dt2.month && dt1.day == dt2.day;
}

String formatTime(DateTime dt) {
  if (dt != null) {
    return DateFormat('Hm').format(dt).toString();
  }
  return '';
}

String formatTemperature(double temp) {
  if (temp != null) {
    return '${temp.toStringAsFixed(0)}°';
  }
  return '';
}
