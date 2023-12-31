import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/social/plan_category.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';

class CreatePlanPickCategory extends StatefulWidget {
  const CreatePlanPickCategory({
    super.key,
    required this.categories,
    required this.addOrRemoveSubcategories,
    required this.selectedSubcategories,
  });

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
          TitleWithInfoTooltip(
            title: 'create_plan.pick_category'.tr(),
            infoTooltip: 'create_plan.pick_category_tooltip'.tr(),
          ),
          for (PlanCategory category in widget.categories)
            ExpansionTile(
              title: Text(
                category.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
