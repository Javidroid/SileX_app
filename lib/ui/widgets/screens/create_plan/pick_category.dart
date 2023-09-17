import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/plan_category.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';

class CreatePlanPickCategory extends StatefulWidget {
  const CreatePlanPickCategory({
    super.key,
    required this.onNext,
    required this.onCancel,
    required this.categories,
    required this.addOrRemoveSubcategories,
    required this.selectedSubcategories,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;
  final List<PlanCategory> categories;
  final Set<String> selectedSubcategories;
  final void Function({required String subcategory, bool isAdd})
      addOrRemoveSubcategories;

  @override
  State<CreatePlanPickCategory> createState() => _CreatePlanPickCategoryState();
}

class _CreatePlanPickCategoryState extends State<CreatePlanPickCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: Insets.a8,
              child: Text(
                'create_plan.pick_category'.tr(),
                style: TextStyles.screenAction,
              ),
            ),
          ),
          for (PlanCategory category in widget.categories)
            ExpansionTile(
              title: Text(
                category.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.black,
              children: [
                for (String subcategory in category.subcategories)
                  CheckboxListTile(
                    title: Text(subcategory),
                    value: widget.selectedSubcategories.contains(subcategory),
                    onChanged: (value) {
                      widget.addOrRemoveSubcategories(
                        subcategory: subcategory,
                        isAdd: value!,
                      );
                    }, // todo put categories on list
                  ),
              ],
            ),
          BoxSpacer.v80(), // avoid FAB overlapping
        ],
      ),
    );
  }
}
