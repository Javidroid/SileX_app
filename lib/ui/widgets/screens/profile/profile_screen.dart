import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/profile/profile_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_content.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_header.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class ProfileScreen extends RootScreen<ProfileViewState> {
  const ProfileScreen({
    super.key,
    required this.userRef,
    required this.isUserRefId,
  });

  TfgNavigator get navigator => getIt<TfgNavigator>();

  final String userRef;
  final bool isUserRefId;

  @override
  ProfileViewModel get viewModel => ProfileViewModel(
        userRef: userRef,
        isUserRefId: isUserRefId,
      );

  @override
  Widget buildView(BuildContext context, ProfileViewState state) {
    // TODO: handle cuando haya error para que enseñe el user outdated,
    //      indicando el error y que es una versión desactualizada
    return switch (state) {
      Loading _ => Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()),
        ),
      Success _ => Scaffold(
          appBar: AppBar(
            title: Text(state.updatedUser.username),
            actions: [
              state.isCurrentUser
                  ? TextButton(
                      onPressed: () {
                        // navigator.navigateToEditProfile();
                      },
                      child: Text(
                        'profile.edit'.tr(),
                        style: TextStyles.whiteTextButton,
                      ), // todo improve
                    )
                  : TextButton(
                      // TODO: make custom follow button
                      onPressed: () {},
                      child: Text(
                        'profile.follow'.tr(),
                      ),
                    )
            ],
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => state.onRefresh(),
              child: ListView(
                children: [
                  ProfileHeader(prof: state.updatedUser.profile),
                  ProfileContent(prof: state.updatedUser.profile),
                ],
              ),
            ),
          ),
        ),
      // TODO: put placeholder of old user
      Error _ => Text(state.error.toString()), // todo handle errors
    };
  }
}
