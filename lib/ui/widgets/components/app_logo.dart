import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/ui/styles/theme.dart';

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
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Image.asset(
          withText
              ? themeNotifier.mode
                  ? 'assets/images/logo-name-black.png'
                  : 'assets/images/logo-name-green.png'
              : 'assets/images/logo.png',
          height: size,
        );
      },
    );
  }
}
