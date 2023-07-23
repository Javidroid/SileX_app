import 'package:age_calculator/age_calculator.dart';

class AgeCalculatorUtil {
  static int getAgeFromBirthDate(DateTime birthDate) {
    return AgeCalculator.age(birthDate).years;
  }
}
