import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// This class is meant to use Auth0's Authentication API instead of Auth0's
/// Universal Login (which is an external web page).
///
/// This allows us to customize the login screen, despite being harder to use.
///
/// More info:
/// https://pub.dev/documentation/auth0_flutter/latest/auth0_flutter/AuthenticationApi-class.html
class AuthService {
  final auth0 = Auth0(
    dotenv.env['AUTH0_DOMAIN']!,
    dotenv.env['AUTH0_CLIENT_ID']!,
  );

  final String _connection = 'Username-Password-Authentication';

  Future<Credentials> login({
    required String usernameOrEmail,
    required String password,
  }) async {
    final result = await auth0.api.login(
      usernameOrEmail: usernameOrEmail,
      password: password,
      connectionOrRealm: _connection,
    );

    return result;
  }

  Future<bool> logout() {
    // TODO: try clear local credentials
    throw UnimplementedError();
  }

  Future<DatabaseUser> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await auth0.api.signup(
      email: email,
      password: password,
      connection: _connection,
    );

    return result;
  }

  Future<bool> clearCredentials() async {
    final result = await auth0.credentialsManager.clearCredentials();

    return result;
  }

  Future<bool> storeCredentials({required Credentials credentials}) async {
    final result = await auth0.credentialsManager.storeCredentials(credentials);

    return result;
  }

  Future<Credentials> getCredentials() async {
    final result = await auth0.credentialsManager.credentials();

    return result;
  }


}
