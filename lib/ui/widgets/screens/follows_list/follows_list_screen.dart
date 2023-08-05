import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';

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
      body: UserList(userIdList: followsList),
    );
  }
}
