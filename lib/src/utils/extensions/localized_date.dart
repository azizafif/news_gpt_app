import 'package:intl/intl.dart';

extension LocalizedDate on DateTime {
  String get localeFormatted => DateFormat.yMd(Intl.getCurrentLocale()).format(this);
}
