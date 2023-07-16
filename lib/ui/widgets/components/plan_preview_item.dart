import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';

class PlanPreviewItem extends StatefulWidget {
  const PlanPreviewItem({super.key});

  @override
  State<PlanPreviewItem> createState() => _PlanPreviewItemState();
}

class _PlanPreviewItemState extends State<PlanPreviewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // TODO: navigate to plan detail
      child: Card(
        /// METER CATEGORÍA POR AHÍ O ALGO
        elevation: 5,
        child: Padding(
          padding: Insets.a8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // todo revisar
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    foregroundImage: // todo pic from plan creator
                        AssetImage('assets/images/no_user_pic.png'),
                  ),
                  const Text(
                    'place', // todo place from plan
                    style: TextStyles.planPreviewHeader,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm')
                        .format(DateTime.now()), // todo date from plan
                    style: TextStyles.planPreviewHeader,
                  )
                ],
              ),
              const Padding(
                padding: Insets.a4,
                child: Text(
                  'description', // todo desc from plan
                  textAlign: TextAlign.justify,
                  style: TextStyles.planPreviewDescription,
                  maxLines: 5,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "x gente inscrita", // todo parameter string
                    style: TextStyles.planPreviewBottom,
                  ),
                  JoinToPlanButton(isJoined: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
