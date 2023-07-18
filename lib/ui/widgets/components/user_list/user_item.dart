import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.user});

  final String user; // todo: type and transform to user with viewmodel

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.v4,
      child: ListTile(
        title: Text('lorem.name'.tr(), style: TextStyles.userListTitle),
        subtitle: Text(
          'lorem.username'.tr(),
          style: TextStyles.userListSubtitle,
        ),

        leading: const NavigableProfilePic(
          asset: 'assets/images/no_user_pic.png',
          radius: 20,
        ),
        onTap: () {},
        tileColor: colorScheme.tertiary,

        // todo refactor
        // todo change color
        // todo navigate to user prof
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
