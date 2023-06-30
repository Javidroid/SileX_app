import 'package:shared_preferences/shared_preferences.dart';

/// Esta clase sirve para gestionar los valores relativos al tema que se
/// almacenarán como SharedPreferences en el dispositivo local.
/// En otras palabras, sirve para guardar si el usuario ha elegido el tema claro
/// o el tema oscuro.
class SharedPreferencesTheme {
  static const currentTheme = "current_theme";

  /// Método que, según el [value] booleano que indica si el tema de la app
  /// es el claro (light) u oscuro (dark).
  ///
  /// Relación de valores:
  /// - True: Claro (light).
  /// - False: Oscuro (dark).
  void setTheme({required bool value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(currentTheme, value);
  }

  /// Método que, recoge el valor del tema almacenado en el dispositivo.
  ///
  /// En caso de no encontrar ningún valor almacenado (se ha devuelto NULL) se
  /// devuelve TRUE (Claro - Light) por defecto.
  ///
  /// Relación de valores:
  /// - True: Claro (light).
  /// - False: Oscuro (dark).
  Future<bool> getTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(currentTheme) ?? true;
  }
}
