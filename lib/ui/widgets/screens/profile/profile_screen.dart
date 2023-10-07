import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/profile/profile_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/follow_button.dart';
import 'package:tfg_v2/ui/widgets/components/list_items/plan_preview_item.dart';
import 'package:tfg_v2/ui/widgets/components/profile/profile_header.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class ProfileScreen extends RootScreen<ProfileViewState, ProfileViewModel> {
  const ProfileScreen({
    super.key,
    required this.userRef,
    required this.isUserRefId,
  }) : super(param1: userRef, param2: isUserRefId);

  TfgNavigator get navigator => getIt<TfgNavigator>();

  /// An user reference that can be their username or their ID
  final String userRef;

  /// True if [userRef] is an ID. False if it's an username
  final bool isUserRefId;

  @override
  Widget buildView(
    BuildContext context,
    ProfileViewState state,
    ProfileViewModel viewModel,
  ) {
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
                  : FollowButton(isFollowing: true),
            ],
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => state.onRefresh(),
              child: ListView(
                children: [
                  ProfileHeader(prof: state.updatedUser.profile),
                  DefaultTabController(
                    length: 1,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                'profile.created_plans'.tr(),
                                style: TextStyles.defaultStyleBold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: Insets.a12,
                          child: Column(
                            children: [
                              for (Plan plan in state.createdPlans)
                                PlanPreviewItem(
                                  plan: plan,
                                  joinButtonBehaviour:
                                      viewModel.joinButtonBehaviour,
                                  checkIfJoined: viewModel.isJoinedChecker,
                                  onPopBehaviour: viewModel.refreshProfile,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      Error _ => Text(state.error.toString()), // todo handle errors
    };
  }
}
