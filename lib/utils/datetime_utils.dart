import 'package:age_calculator/age_calculator.dart';
import 'package:easy_localization/easy_localization.dart';
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

  static String dateTimeToString({
    required DateTime date,
    bool appendWeekday = true,
  }) {
    return appendWeekday
        ? "${getTranslatedWeekday(date.weekday)}, ${date.day}/${date.month}/${date.year}"
        : "${date.day}/${date.month}/${date.year}";
  }

  static String timeOfDayToString(TimeOfDay time) {
    String addLeadingZeroIfNeeded(int value) {
      if (value < 10) {
        return '0$value';
      }
      return value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(time.hour);
    final String minuteLabel = addLeadingZeroIfNeeded(time.minute);

    return '$hourLabel:$minuteLabel';
  }

  static String getTranslatedWeekday(int weekday) {
    return switch (weekday) {
      1 => 'weekdays.monday'.tr().toLowerCase(),
      2 => 'weekdays.tuesday'.tr().toLowerCase(),
      3 => 'weekdays.wednesday'.tr().toLowerCase(),
      4 => 'weekdays.thursday'.tr().toLowerCase(),
      5 => 'weekdays.friday'.tr().toLowerCase(),
      6 => 'weekdays.saturday'.tr().toLowerCase(),
      7 => 'weekdays.sunday'.tr().toLowerCase(),
      _ => 'Unknown',
    };
  }
}
