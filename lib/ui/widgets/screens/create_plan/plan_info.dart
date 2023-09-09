import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreatePlanPlanInfo extends StatelessWidget {
  const CreatePlanPlanInfo({
    super.key,
    required this.onFinish,
    required this.onCancel,
  });

  final VoidCallback onFinish;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onFinish,
      child: Text('create_plan.plan_info'.tr()),
    );
  }
}
