import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.user});

  final String user; // todo: type and transform to user with viewmodel

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user),
    );
  }
}
