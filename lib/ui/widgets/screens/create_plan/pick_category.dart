import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreatePlanPickCategory extends StatelessWidget {
  const CreatePlanPickCategory({
    super.key,
    required this.onNext,
    required this.onCancel,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onNext,
      child: Text('create_plan.pick_category'.tr()),
    );
  }
}
