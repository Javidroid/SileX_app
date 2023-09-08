import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class CreatePlanScreen
    extends RootScreen<CreatePlanViewState, CreatePlanViewModel> {
  const CreatePlanScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    CreatePlanViewState state,
    CreatePlanViewModel viewModel,
  ) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'create_plan.title'.tr()),
      body: Center(
        child: switch (state) {
          Loading _ => const CircularProgressIndicator(),
          Success _ => Text('create_plan.title'.tr()),
          Error _ => Text(state.error.toString()), // todo handle errors
        },
      ),
    );
  }
}
