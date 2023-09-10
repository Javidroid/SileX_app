import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/category.dart';

class CreatePlanPickCategory extends StatefulWidget {
  const CreatePlanPickCategory({
    super.key,
    required this.onNext,
    required this.onCancel,
    required this.categories,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;
  final List<Category> categories;

  @override
  State<CreatePlanPickCategory> createState() => _CreatePlanPickCategoryState();
}

class _CreatePlanPickCategoryState extends State<CreatePlanPickCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (Category category in widget.categories)
            ExpansionTile(
              title: Text(category.name),
              subtitle: Text('Trailing expansion arrow icon'),
              children: [
                for (String subcategory in category.subcategories)
                  CheckboxListTile(
                    title: Text(subcategory),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
