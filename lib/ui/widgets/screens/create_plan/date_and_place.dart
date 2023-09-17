import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';

class CreatePlanDateAndPlace extends StatelessWidget {
  const CreatePlanDateAndPlace({
    super.key,
    required this.onNext,
    required this.onCancel,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'create_plan.place_and_date'.tr(),
            infoTooltip: 'create_plan.place_and_date_tooltip'.tr(),
          ),
        ],
      ),
    );
  }
}
