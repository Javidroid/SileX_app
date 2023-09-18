import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'create_plan.plan_info'.tr(),
            infoTooltip: 'create_plan.plan_info_tooltip'.tr(),
          ),

        ],
      ),
    );
  }
}
