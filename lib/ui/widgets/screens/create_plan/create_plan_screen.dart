import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/snackbars/custom_snackbar.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/date_and_place.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/pick_category.dart';
import 'package:tfg_v2/ui/widgets/screens/create_plan/plan_info.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class CreatePlanScreen
    extends RootScreenStateful<CreatePlanViewState, CreatePlanViewModel> {
  const CreatePlanScreen({super.key});

  @override
  RootScreenState<CreatePlanViewState, CreatePlanViewModel,
          RootScreenStateful<CreatePlanViewState, CreatePlanViewModel>>
      createState() => _CreatePlanState();
}

class _CreatePlanState extends RootScreenState<
    CreatePlanViewState,
    CreatePlanViewModel,
    RootScreenStateful<CreatePlanViewState, CreatePlanViewModel>> {
  final _formKey = GlobalKey<FormState>();
  bool _validated = false;

  final placeController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool validateInput() {
    return _formKey.currentState!.validate();
  }

  void showSnackbar({
    String? title,
    String? body,
    required SnackbarType snackbarType,
  }) {
    CustomSnackbar.show(
      context: context,
      title: title,
      body: body,
      snackbarType: snackbarType,
    );
  }

  @override
  void initState() {
    super.initState();
    viewModel.bindShowSnackbar(showSnackbar); // Bind AFTER initState
  }

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
              child: Form(
                key: _formKey,
                onChanged: () => setState(() => _validated = validateInput()),
                child: Column(
                  children: [
                    CreatePlanPickCategory(
                      categories: viewModel.categories,
                      addOrRemoveSubcategories:
                          viewModel.addOrDeletePlanCategory,
                      selectedSubcategories: viewModel.selectedSubcategories,
                    ),
                    BoxSpacer.v24(),
                    CreatePlanDateAndPlace(
                      setDate: viewModel.setDate,
                      setTime: viewModel.setTime,
                      controller: placeController,
                      date: viewModel.date,
                      time: viewModel.time,
                    ),
                    BoxSpacer.v24(),
                    CreatePlanInfo(
                      titleController: titleController,
                      descriptionController: descriptionController,
                      setMaxUsers: viewModel.setMaxUsers,
                    ),
                    BoxSpacer.v80(),
                  ],
                ),
              ),
            ),
          ),
        Error _ => ErrorCard(error: state.error),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: _validated
            ? () => viewModel.finishOperation(
                  title: titleController.text,
                  description: descriptionController.text,
                  place: placeController.text,
                )
            : null,
        disabledElevation: 0,
        backgroundColor: _validated ? colorScheme.secondary : Colors.grey,
        child: const Icon(Icons.rocket_launch),
      ),
    );
  }

  @override
  void dispose() {
    placeController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
