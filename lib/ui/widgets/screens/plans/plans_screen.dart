import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/plans/plans_list.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class PlansScreen extends RootScreen<PlansViewState, PlansViewModel> {
  const PlansScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    PlansViewState state,
    PlansViewModel viewModel,
  ) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: switch (state) {
          Loading _ => const CircularProgressIndicator(),
          Success _ => RefreshIndicator(
              onRefresh: () => viewModel.refreshPlans(),
              child: state.planList.isNotEmpty
                  ? PlansList(
                      planList: state.planList,
                      joinButtonBehaviour: viewModel.joinButtonBehaviour,
                      isJoinedChecker: viewModel.isJoinedChecker,
                      onDetailPopBehaviour: viewModel.refreshPlans,
                    )
                  : Center(
                      child: Text(
                        'home.empty_list'.tr(),
                        style: TextStyles.defaultStyleBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          Error _ => RefreshIndicator(
              onRefresh: () => viewModel.refreshPlans(),
              child: ErrorCard(
                onRetry: viewModel.refreshPlans,
                error: state.error,
              ),
            ),
        },
      ),
    );
  }
}
