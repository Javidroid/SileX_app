import 'package:flutter/material.dart';

class FollowsList extends StatelessWidget {
  const FollowsList({
    super.key,
    required this.followsList,
    required this.followingOrFollowers,
  });

  final List<String> followsList; // todo: type
  final bool followingOrFollowers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(followingOrFollowers ? 'Siguiendo' : 'Seguidores'),
      ),
      body: const Placeholder(), //UserList(userList: followsList), // todo
    );
  }
}
