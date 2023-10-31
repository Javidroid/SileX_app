import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 250,
    this.withText = false,
  });

  final double size;
  final bool withText;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      withText ? 'assets/images/logo-name-black.png' : 'assets/images/logo.png',
      height: size,
    );
  }
}
