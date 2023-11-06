import 'package:flutter/material.dart';

class ProfilePicGenerator {
  static String generateByUsername({required String username}) {
    final String text = username.characters.first;
    return 'https://placehold.co/200x200/00B28C/EAAF0F.png?text=$text';
  }

  static String generateByName({
    required String name,
    required String surname,
  }) {
    final String text = "${name.characters.first}${surname.characters.first}";
    return 'https://placehold.co/200x200/00B28C/EAAF0F.png?text=$text';
  }
}
