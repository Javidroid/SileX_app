import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/date_and_place.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/pick_category.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/plan_info.dart';
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
      body: switch (state) {
        Loading _ => const Center(child: CircularProgressIndicator()),
        Success _ => SingleChildScrollView(
            child: Padding(
              padding: Insets.a12,
              child: [
                CreatePlanPickCategory(
                  onNext: viewModel.nextPage,
                  onCancel: viewModel.cancelOperation,
                  categories: viewModel.categories,
                  addOrRemoveSubcategories: viewModel.addOrDeletePlanCategory,
                  selectedSubcategories: viewModel.selectedSubcategories,
                ),
                CreatePlanDateAndPlace(
                  onNext: viewModel.nextPage,
                  onCancel: viewModel.cancelOperation,
                  setDate: viewModel.setDate,
                  setTime: viewModel.setTime,
                  setPlace: viewModel.setPlace,
                  controller: viewModel.placeController,
                ),
                CreatePlanPlanInfo(
                  onFinish: viewModel.finishOperation,
                  onCancel: viewModel.cancelOperation,
                ),
              ][viewModel.currentPageIndex],
            ),
          ),
        Error _ => Text(state.error.toString()), // todo handle errors
      },
      floatingActionButton: !viewModel.isLastPage
          ? FloatingActionButton(
              onPressed: viewModel.nextPage,
              child: const Icon(Icons.navigate_next),
            )
          : FloatingActionButton(
              onPressed: viewModel.finishOperation,
              child: const Icon(Icons.rocket_launch),
            ),
    );
  }
}
