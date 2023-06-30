import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/shared_preferences/theme_preferences.dart';

/// Clase encargada de crear los Temas Claro y Oscuro mediante la extensión
/// [FlexColorScheme](https://pub.dev/packages/flex_color_scheme).
///
/// Los métodos de esta clase deberían ser llamados en los campos Theme: y
/// DarkTheme: del Widget MaterialApp que se encarga de generar el Root de
/// la aplicación en el método build() de [MyApp].
class ThemeGenerator {
  /// Constante que guarda el esquema de color
  ///
  /// Al ser estático, se puede utilizar para usar la paleta de colores
  /// en momentos puntuales y concretos al desarrollar la IU sin necesidad
  /// de recurrir a Theme.of(context), que suele dar errores.
  static const FlexSchemeColor esquemaColor = FlexSchemeColor(
    primary: Color(0xff00b28c),
    primaryContainer: Color(0xffd0e4ff),
    secondary: Color(0xffeaaf0f),
    secondaryContainer: Color(0xffffdbcf),
    tertiary: Color(0xff26d8b2),
    tertiaryContainer: Color(0xff95f0ff),
    appBarColor: Color(0xffffdbcf),
    error: Color(0xffb00020),
  );

  /// Método que genera la configuración necesaria para establecer el Tema Claro
  /// en los Widgets de la App de forma coherente y conjunta.
  static ThemeData generateLightTheme() {
    return FlexThemeData.light(
      colors: esquemaColor,
      usedColors: 4,
      surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
      blendLevel: 20,
      appBarOpacity: 0.98,
      appBarElevation: 4.0,
      subThemesData: const FlexSubThemesData(
        elevatedButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.onSecondary,
        toggleButtonsSchemeColor: SchemeColor.secondary,
        switchSchemeColor: SchemeColor.primary,
        radioSchemeColor: SchemeColor.primary,
        sliderBaseSchemeColor: SchemeColor.primary,
        inputDecoratorRadius: 25.0,
        inputDecoratorUnfocusedHasBorder: false,
        chipSchemeColor: SchemeColor.primary,
        chipRadius: 30.0,
        popupMenuRadius: 10.0,
        popupMenuElevation: 15.0,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        keepPrimary: true,
        keepSecondary: true,
      ),
      tones: FlexTones.highContrast(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: 'Futura-Bold', // todo revisar fuente
    );
  }

  /// Método que genera la configuración necesaria para establecer el Tema
  /// Oscuro en los Widgets de la App de forma coherente y conjunta.
  static ThemeData generateDarkTheme() {
    return FlexThemeData.dark(
      colors: esquemaColor,
      usedColors: 4,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 15,
      subThemesData: const FlexSubThemesData(
        textButtonSchemeColor: SchemeColor.secondary,
        // mod
        elevatedButtonSchemeColor: SchemeColor.secondary,
        elevatedButtonSecondarySchemeColor: SchemeColor.onSecondary,
        outlinedButtonSchemeColor: SchemeColor.secondary,
        // mod
        toggleButtonsSchemeColor: SchemeColor.secondary,
        // mod
        switchSchemeColor: SchemeColor.secondary,
        // mod
        checkboxSchemeColor: SchemeColor.secondary,
        // mod
        radioSchemeColor: SchemeColor.secondary,
        // mod
        sliderBaseSchemeColor: SchemeColor.secondary,
        // mod
        inputDecoratorRadius: 25.0,
        inputDecoratorUnfocusedHasBorder: false,
        chipSchemeColor: SchemeColor.secondary,
        // mod
        chipRadius: 30.0,
        popupMenuRadius: 10.0,
        popupMenuElevation: 15.0,
        tabBarItemSchemeColor: SchemeColor.secondary,
        tabBarIndicatorSchemeColor: SchemeColor.primary,
        bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
        // mod
        bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
        // mod
        navigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
        // mod
        navigationBarSelectedIconSchemeColor: SchemeColor.secondary,
        // mod
        navigationBarIndicatorSchemeColor: SchemeColor.secondary, // mod
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
      ),
      tones: FlexTones.highContrast(Brightness.dark),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: 'Futura', // todo revisar fuente
    );
  }
}

/// Clase que se utiliza para notificar si el usuario ha cambiado entre el modo
/// claro o el oscuro.
class ThemeNotifier extends ChangeNotifier {
  /// Indica el modo actualmente activo.
  ///
  /// True: Claro / False: Oscuro
  late bool _mode;

  bool get modo => _mode;

  /// Instancia de [SharedPreferencesTheme] para acceder al Shared Preferences.
  ///
  /// Esto sirve para poder guardar localmente el tema que se haya elegido y que
  /// se quede para futuras ejecuciones de la App.
  late SharedPreferencesTheme _pref;

  /// El constructor genera un objeto con el [_mode] inicializado a Claro. Esto
  /// es por si es la primera vez que se ejecuta la app y no hay preferencias
  /// previas.
  ///
  /// Crea un objeto para acceder a las SharedPreferences del dispositivo que
  /// se rellena en cuanto se llama a [getPreferences].
  ///
  /// El resultado es una instancia de la clase [ThemeNotifier] con acceso a las
  /// SharedPreferences almacenadas y el [_mode] del Tema establecido según lo
  /// almacenado.
  ThemeNotifier() {
    _mode = true;
    _pref = SharedPreferencesTheme();
    getPreferences();
  }

  /// Alterna el [_mode] entre Claro y Oscuro. Notifica a los observadores.
  set modo(bool value) {
    _mode = value;
    _pref.setTheme(value: value);
    notifyListeners();
  }

  /// Accede asíncronamente (por la indefinida tardanza de acceso a disco) a las
  /// SharedPreferences y almacena en [_mode] el valor que haya almacenado.
  /// Después, notifica a todos los observadores.
  void getPreferences() async {
    _mode = await _pref.getTheme();
    notifyListeners();
  }
}
