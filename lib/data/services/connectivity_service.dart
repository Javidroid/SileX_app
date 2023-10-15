import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {

  /// Returns true if device can access internet connection.
  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult != ConnectivityResult.none;
  }
}
