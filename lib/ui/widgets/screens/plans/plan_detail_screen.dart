import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/plans/plan_detail_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join_to_plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/dialogs/delete_plan_dialog.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';
import 'package:tfg_v2/ui/widgets/components/shimmer.dart';
import 'package:tfg_v2/ui/widgets/components/snackbars/custom_snackbar.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class PlanDetailScreen
    extends RootScreen<PlanDetailViewState, PlanDetailViewModel> {
  const PlanDetailScreen({super.key, required this.plan}) : super(param1: plan);

  final Plan plan;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  void showConfirmDeletePlanDialog({
    required BuildContext context,
    required VoidCallback onAccept,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => DeletePlanDialog(onAccept: onAccept),
    );
  }

  void showErrorSnackbar(BuildContext context) {
    CustomSnackbar.show(snackbarType: SnackbarType.error, context: context);
  }

  @override
  Widget buildView(
    BuildContext context,
    PlanDetailViewState state,
    PlanDetailViewModel viewModel,
  ) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: (state is Success) ? state.plan.title : null,
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: switch (state) {
          (Loading _ || Success _) => Padding(
              padding: Insets.a16,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: Constants.profilePicHeroTag,
                        child: NavigableProfilePic(
                          asset: state.plan.creatorProfPic,
                          onTap: (state is Success)
                              ? () => navigator.toProfile(
                                    userRef: plan.creatorId,
                                    isUserRefId: true,
                                  )
                              : null,
                          radius: 30,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            state.plan.place,
                            style: TextStyles.defaultStyleBold,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy, kk:mm')
                                .format(state.plan.date),
                            style: TextStyles.defaultStyleBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: Insets.v8,
                    child: Column(
                      children: [
                        Text(
                          state.plan.title,
                          textAlign: TextAlign.center,
                          style: TextStyles.defaultStyleBold,
                        ),
                        Text(
                          state.plan.description,
                          textAlign: TextAlign.justify,
                          style: TextStyles.defaultStyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'components.plans.people'.tr(
                          args: [
                            state.plan.joinedUsers.length.toString(),
                            state.plan.maxUsers.toString(),
                          ],
                        ),
                        style: TextStyles.defaultStyle,
                      ),
                      (state is Success)
                          ? JoinToPlanButton(
                              isJoined:
                                  viewModel.isJoinedChecker(plan: state.plan),
                              joinBehaviour: () =>
                                  viewModel.joinButtonBehaviour(
                                plan: state.plan,
                                isJoin: true,
                                onError: (context) =>
                                    showErrorSnackbar(context),
                              ),
                              quitBehaviour: () =>
                                  viewModel.joinButtonBehaviour(
                                plan: state.plan,
                                isJoin: false,
                                onError: (context) =>
                                    showErrorSnackbar(context),
                              ),
                            )
                          : const AppShimmer(
                              child: JoinToPlanButton(
                                isJoined: false,
                                joinBehaviour: null,
                                quitBehaviour: null,
                              ),
                            ),
                    ],
                  ),
                  const Padding(
                    padding: Insets.v12,
                    child: Divider(thickness: 2),
                  ),
                  Padding(
                    padding: Insets.h4,
                    child: Text('components.plans.joined_users'.tr()),
                  ),
                  BoxSpacer.v4(),
                  (state is Success)
                      ? UserList(
                          userList: state.joinedUsers,
                          howManyIfLoading: state.joinedUsers.length,
                        )
                      : UserList(
                          howManyIfLoading: state.plan.joinedUsers.length,
                        ),
                  if (viewModel.isPlanCreatedByCurrentUser)
                    Column(
                      children: [
                        const Padding(
                          padding: Insets.v12,
                          child: Divider(thickness: 2),
                        ),
                        TextButton(
                          onPressed: () => showConfirmDeletePlanDialog(
                            context: context,
                            onAccept: () => viewModel.deletePlan(
                              onError: (context) => showErrorSnackbar(context),
                            ),
                          ),
                          child: Text(
                            'delete_plan.button_text'.tr(),
                            style: TextStyles.cancelTextButton,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          Error _ => Center(
              child: ErrorCard(error: state.error, onRetry: viewModel.refresh),
            ),
        },
      ),
    );
  }
}
