import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toMonth3FirstLetters(Locale locale) {
    var dayMonthFormatter = DateFormat('MMM', locale.toString());

    String dayMonth = dayMonthFormatter.format(this);
    dayMonth =
        "${dayMonth[0].toUpperCase()}${dayMonth.substring(1, 3).toLowerCase()}";
    return dayMonth;
  }

  String toMonthLiteral(Locale locale) {
    var dayMonthFormatter = DateFormat('MMMM', locale.toString());

    String dayMonth = dayMonthFormatter.format(this);
    dayMonth =
        "${dayMonth[0].toUpperCase()}${dayMonth.substring(1).toLowerCase()}";
    return dayMonth;
  }
}
