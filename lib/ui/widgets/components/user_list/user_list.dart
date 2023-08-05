import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/components/user_list_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class UserList extends RootScreen<UserListViewState> {
  const UserList({super.key, required this.userIdList});

  final List<String> userIdList;

  // TODO: fix: because state is updated twice, UserList renders twice,
  //  making the userlist viewmodel make the call twice
  //  should be linked ¿? to plan detail viewmodel?

  @override
  UserListViewModel get viewModel => UserListViewModel(userIdList: userIdList);

  @override
  Widget buildView(BuildContext context, UserListViewState state) {
    return switch (state) {
      Loading _ => _LoadingListItem(howMany: userIdList.length),
      Success _ => Column(
          children: [
            for (User user in state.userList) _UserListItem(user: user),
          ],
        ),
      Error _ => Text(state.error.toString()), // todo handle errors
    };
  }
}

class _UserListItem extends StatelessWidget {
  const _UserListItem({required this.user});

  final User user;

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
          asset: user.profile.profilePic,
          radius: 20,
        ),
        onTap: () {},
        // todo navigate to profile
        tileColor: colorScheme.tertiary,
        dense: true,
        visualDensity: VisualDensity.compact,
        // TODO selected: if current user,
        // todo refactor
        // todo navigate to user prof
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class _LoadingListItem extends StatelessWidget {
  const _LoadingListItem({this.howMany = 3});

  /// Number of tiles wanted to print. Defaults to 3.
  final int howMany;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        howMany,
        (index) => Padding(
          padding: Insets.v4,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
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
              leading: const NavigableProfilePic(
                asset: Constants.defaultProfilePic,
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
