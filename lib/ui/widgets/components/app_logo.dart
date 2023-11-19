import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/ui/styles/theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 250,
    this.withText = false,
    this.onlyText = false,
  });

  final double size;
  final bool withText;
  final bool onlyText;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return Image.asset(
          onlyText
              ? themeNotifier.mode
                  ? 'assets/images/name-black.png'
                  : 'assets/images/name-green.png'
              : withText
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
