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
    fontSize: 18,
  );
  static const TextStyle profileSubtitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const TextStyle profileDescription = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}
