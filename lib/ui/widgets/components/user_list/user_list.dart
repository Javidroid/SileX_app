import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';
import 'package:tfg_v2/ui/widgets/components/shimmer.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    this.userList,
    this.howManyIfLoading = 3,
  });

  /// The user list wanted to show. If null, shimmer is shown.
  final List<User>? userList;

  /// How many tiles are wanted to show when loading data.
  final int howManyIfLoading;

  @override
  Widget build(BuildContext context) {
    return (userList != null)
        ? Column(
            children: [
              for (User user in userList!) _UserListItem(user: user),
            ],
          )
        : _LoadingListItem(howMany: howManyIfLoading);
  }
}

class _UserListItem extends StatelessWidget {
  const _UserListItem({required this.user});

  final User user;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.v4,
      child: ListTile(
        title: Text(
          "${user.profile.name} ${user.profile.surnames}",
          style: TextStyles.userListTitle,
        ),
        subtitle: Text(
          user.username,
          style: TextStyles.userListSubtitle,
        ),
        leading: NavigableProfilePic(
          // todo: put hero
          asset: user.profile.profilePic,
          radius: 20,
          onTap: () => navigator.toProfile(
            userRef: user.username,
            isUserRefId: false,
          ),
        ),
        onTap: () => navigator.toProfile(
          userRef: user.username,
          isUserRefId: false,
        ),
        // todo navigate to profile
        tileColor: colorScheme.tertiary,
        dense: true,
        visualDensity: VisualDensity.compact,
        // TODO selected: if current user,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class _LoadingListItem extends StatelessWidget {
  const _LoadingListItem({required this.howMany});

  final int howMany;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        howMany,
        (index) => Padding(
          padding: Insets.v4,
          child: AppShimmer(
            child: ListTile(
              title: Container(
                height: 11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
              ),
              subtitle: Container(
                height: 11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
              ),
              leading: const CircleAvatar(
                radius: 20,
              ),
              tileColor: colorScheme.tertiary,
              dense: true,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
