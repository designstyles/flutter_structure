import 'package:intl/intl.dart';

class DateUilities {
  static String formateDateForApi(DateTime dateValue) {
    return DateFormat().addPattern('yyyy-MM-dd').format(dateValue);
  }

  static String formateDateForUi(DateTime dateValue) {
    //July 10, 1996
    return DateFormat().add_yMMMMd().format(dateValue);
  }
}
