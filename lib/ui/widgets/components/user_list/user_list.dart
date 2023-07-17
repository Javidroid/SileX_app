import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_item.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.userList});

  final List<String> userList; // todo: type

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userList.map((e) => UserListItem(user: e)).toList(),
    );
  }
}
