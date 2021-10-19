import 'package:intl/intl.dart';

class DateTimeHelper {
  static String toDayMonthYear(String iso8601String) {
    var format = "dd/MM/yyyy";
    if (iso8601String != "") {
      DateTime tempDate = DateTime.parse(iso8601String);
      String result = DateFormat(format).format(tempDate);
      return result;
    } else
      return iso8601String;
  }

}