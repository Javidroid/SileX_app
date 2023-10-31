import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg_v2/data/dto/user_dto.dart';
import 'package:tfg_v2/domain/model/user.dart';

class SessionSharedPreferences {
  static const _currentLoggedUser = "current_user";
  static const _currentLoggedUsername = "current_username";

  static void setCurrentUser({required User user}) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    // set the username
    sharedPref.setString(_currentLoggedUsername, user.username);

    // set the whole user object
    sharedPref.setString(
      _currentLoggedUser,
      jsonEncode(UserDto.fromModel(user).toJson()),
    );
  }

  static Future<String?> getCurrentUsername() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(_currentLoggedUsername);
  }

  static Future<User?> getCurrentUser() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final json = sharedPref.getString(_currentLoggedUser);
    return json != null ? UserDto.fromJson(jsonDecode(json)).toModel() : null;
  }

  static void clear() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();

    sharedPref.clear();
  }
}
