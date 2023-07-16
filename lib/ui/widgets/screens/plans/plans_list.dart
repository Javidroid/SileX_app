import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/plan_preview_item.dart';

class PlansList extends StatelessWidget {
  const PlansList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: [
          BoxSpacer.v4(),
          PlanPreviewItem(),
          PlanPreviewItem(),
          PlanPreviewItem(),
        ],
      ),
    );
  }
}
