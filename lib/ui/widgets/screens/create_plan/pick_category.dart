import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/category.dart';

class CreatePlanPickCategory extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onNext,
      child: Text('create_plan.pick_category'.tr()),
      // TODO: poner list con checkboxes
    );
  }
}
