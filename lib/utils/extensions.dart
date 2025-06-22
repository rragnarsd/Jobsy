import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toShortFormattedDate() {
    final formatter = DateFormat('d. MMM yyyy');
    return formatter.format(this);
  }
}

