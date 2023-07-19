import 'package:flutter/material.dart';

class Fonts {
  // TODO: import fonts
  static const String futuraLight = 'Futura-Light';
  static const String futuraMedium = 'Futura';
  static const String futuraBold = 'Futura-Bold';
  static const String futuraExtraBold = 'Futura-ExtraBold';
}

class TextStyles {
  // TODO: define & improve default text styles

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
    color: Colors.white, // todo: stardardize
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

  // FAQ
  static const TextStyle faqQuestion = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle faqAnswer = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
}
