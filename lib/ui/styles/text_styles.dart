import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/colors.dart';

class Fonts {
  static const String futuraLight = 'Futura-Light';
  static const String futuraMedium = 'Futura';
  static const String futuraBold = 'Futura-Bold';
  static const String futuraExtraBold = 'Futura-ExtraBold';
}

class TextStyles {
  static const TextStyle defaultStyle = TextStyle(
    fontSize: 18,
  );
  static const TextStyle defaultStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle defaultStyleLight = TextStyle(
    fontFamily: Fonts.futuraLight,
    fontSize: 18,
  );

  static const TextStyle whiteTextButton = TextStyle(
    color: Colors.white,
    // fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static TextStyle cancelTextButton = TextStyle(
    color: colorScheme.error,
    fontWeight: FontWeight.bold,
  );

  // PROFILE
  static const TextStyle profileNumberButton = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );
  static const TextStyle profileTitle = TextStyle(
    fontFamily: Fonts.futuraMedium,
    fontSize: 20,
  );

  // PLAN PREVIEW
  static const TextStyle planPreviewBottom = TextStyle(
    fontSize: 16,
  );

  // USER LIST
  static const TextStyle userListTitle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle userListSubtitle = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  // CREATE PLAN
  static const TextStyle stepTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle createPlanText = TextStyle(
    fontSize: 20,
  );
  static const TextStyle createPlanTextParameter = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle createPlanTextButton = TextStyle(
    color: colorScheme.primary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle createPlanNumber = TextStyle(
    color: colorScheme.primary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // FAQ
  static const TextStyle faqQuestion = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle faqAnswer = TextStyle(
    fontSize: 16,
  );

  // ERROR
  static TextStyle errorMessage = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  static TextStyle noInternetText = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}
