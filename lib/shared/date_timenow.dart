import 'package:intl/intl.dart';

//-------- CLASS UNTUK MEMBUAT RECORD TANGGAL BERGABUNG -------------------//
class DateTimeNow {
  static String datetimenow() {
    var now = DateTime.now();
    var formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(now);
  }
}
