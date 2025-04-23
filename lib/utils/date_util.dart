import 'package:intl/intl.dart';

String formatDateMsByMS(num milliseconds) {
  return formatDate(milliseconds, 'mm:ss');
}

String formatDateMsByYMD(num milliseconds) {
  return formatDate(milliseconds, 'yyyy/MM/dd');
}

String formatDateMsByYMDHM(num milliseconds) {
  return formatDate(milliseconds, 'yyyy/MM/dd HH:mm');
}

String formatDate(num milliseconds, String format) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds.toInt());
  return DateFormat(format).format(dateTime);
}