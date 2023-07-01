import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/theme.dart';

void main() async {
  configureDependencies(env: const String.fromEnvironment("ENVIRONMENT"));
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('es'),
      child: const TfgApp(),
    ),
  );
}

class TfgApp extends StatelessWidget {
  const TfgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier themeNotifier, child) {
          return MaterialApp.router(
            title: 'TFG APP',
            theme: ThemeGenerator.generateLightTheme(),
            darkTheme: ThemeGenerator.generateDarkTheme(),
            themeMode: themeNotifier.modo
                ? // según el modo guardado en SharedPreferences
                ThemeMode.light
                : ThemeMode.dark,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: getIt<TfgNavigator>().router,
          );
        },
      ),
    );
  }
}
