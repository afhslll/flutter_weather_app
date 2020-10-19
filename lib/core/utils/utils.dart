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

double getHeightMultiplier(double height) {
  if (height > 895) {
    return 2;
  } else if (height > 811 && height < 896) {
    return 1.7;
  } else if (height > 735 && height < 812) {
    return 1.5;
  } else if (height > 666 && height < 736) {
    return 1.3;
  }
  return 1;
}
