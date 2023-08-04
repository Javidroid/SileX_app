import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/plans/plans_list.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class PlansScreen extends RootScreen<PlansViewState> {
  const PlansScreen({super.key});

  @override
  PlansViewModel get viewModel => getIt<PlansViewModel>();

  @override
  Widget buildView(BuildContext context, PlansViewState state) {
    return Container(
      alignment: Alignment.center,
      child: switch (state) {
        Loading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        Success _ => Center(
            child: RefreshIndicator(
              onRefresh: () => state.onRefresh(),
              child: PlansList(
                planList: state.planList,
              ),
            ),
          ),
        Error _ => Text(state.error.toString()), // todo handle errors
      },
    );
  }
}
