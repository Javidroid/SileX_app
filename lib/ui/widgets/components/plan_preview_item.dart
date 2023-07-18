import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';

class PlanPreviewItem extends StatelessWidget {
  const PlanPreviewItem({super.key});

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigator.navigateToPlanDetail('INSERTid'),
      child: Card(
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
                  Text(
                    'lorem.place'.tr(), // todo place from plan
                    style: TextStyles.defaultStyleBold,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm')
                        .format(DateTime.now()), // todo date from plan
                    style: TextStyles.defaultStyleBold,
                  )
                ],
              ),
              Padding(
                padding: Insets.a8,
                child: Text(
                  'lorem.description'.tr(), // todo desc from plan
                  textAlign: TextAlign.justify,
                  style: TextStyles.defaultStyleLight,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "x gente inscrita", // todo parameter string
                    style: TextStyles.defaultStyleBold,
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
