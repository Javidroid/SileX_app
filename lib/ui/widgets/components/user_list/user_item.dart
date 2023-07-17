import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.user});

  final String user; // todo: type and transform to user with viewmodel

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.a4,
      child: ListTile(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username", style: TextStyles.userListUsername),
            Text("RealName", style: TextStyles.userListRealName),
          ],
        ),
        leading: const NavigableProfilePic(
          asset: 'assets/images/no_user_pic.png',
          radius: 20,
        ),
        onTap: () {},
        tileColor: Colors.white,
        // todo change color
        // todo navigate to user prof
        shape: const RoundedRectangleBorder(),
      ),
    );
  }
}
