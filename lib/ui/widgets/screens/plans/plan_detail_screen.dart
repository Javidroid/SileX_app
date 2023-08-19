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
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';
import 'package:tfg_v2/ui/widgets/components/shimmer.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class PlanDetailScreen extends RootScreen<PlanDetailViewState> {
  PlanDetailScreen({super.key, required this.plan}) {
    viewModel = PlanDetailViewModel(planFromList: plan);
  }

  final Plan plan;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  late final PlanDetailViewModel viewModel;

  @override
  Widget buildView(BuildContext context, PlanDetailViewState state) {
    return Scaffold(
      appBar:
          DefaultAppBar(title: (state is Success) ? state.plan.title : null),
      body: switch (state) {
        (Loading _ || Success _) => ListView(
            padding: Insets.a16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: Constants.profilePicHeroTag,
                    child: NavigableProfilePic(
                      asset: state.plan.creatorProfPic,
                      onTap: (state is Success)
                          ? () => navigator.navigateToProfile(
                                userRef: plan.creatorId,
                                isUserRefId: true,
                              )
                          : null,
                      radius: 30,
                    ),
                  ),
                  Text(
                    state.plan.place,
                    style: TextStyles.defaultStyleBold,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm').format(state.plan.date),
                    style: TextStyles.defaultStyleBold,
                  )
                ],
              ),
              Padding(
                padding: Insets.v8,
                child: Text(
                  state.plan.description,
                  textAlign: TextAlign.justify,
                  style: TextStyles.defaultStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          isJoined: viewModel.isJoinedChecker(plan: plan),
                          joinBehaviour: () => viewModel.joinButtonBehaviour(
                            idPlan: plan.idPlan,
                            isJoin: false,
                          ),
                          quitBehaviour: () => viewModel.joinButtonBehaviour(
                            idPlan: plan.idPlan,
                            isJoin: true,
                          ),
                        )
                      : const AppShimmer(
                          child: JoinToPlanButton(
                            isJoined: false,
                            joinBehaviour: null,
                            quitBehaviour: null,
                          ),
                        )
                ],
              ),
              const Padding(padding: Insets.v12, child: Divider(thickness: 2)),
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
                  : UserList(howManyIfLoading: state.plan.joinedUsers.length)
            ],
          ),
        Error _ => Text(state.error.toString()), // todo handle errors
      },
    );
  }
}
