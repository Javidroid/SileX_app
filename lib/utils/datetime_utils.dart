import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';

class DateTimeUtils {
  static int getAgeFromBirthDate(DateTime birthDate) {
    return AgeCalculator.age(birthDate).years;
  }

  /// Returns a single DateTime from given [date] (ignores time) and [time]
  static DateTime getDateTimeFromDateAndTime({
    required DateTime date,
    required TimeOfDay time,
  }) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
