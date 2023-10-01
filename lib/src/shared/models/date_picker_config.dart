import 'package:flutter/widgets.dart';

class DatePickerconfig {
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  DatePickerconfig({
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });
}

class DatePickerConfig {
  final DatePickerconfig? dates;
  TextEditingController controller;

  DatePickerConfig({
    this.dates,
    required this.controller,
  });
}
