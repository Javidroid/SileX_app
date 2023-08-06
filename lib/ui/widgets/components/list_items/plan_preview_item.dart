import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class PlanPreviewItem extends StatelessWidget {
  const PlanPreviewItem({
    super.key,
    required this.plan,
  });

  final Plan plan;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigator.navigateToPlanDetail(plan),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: Insets.a12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // todo revisar
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigableProfilePic(
                    asset: plan.creatorProfPic,
                    onTap: () => navigator.navigateToProfile(
                      userRef: plan.creatorId,
                      isUserRefId: true,
                    ),
                    radius: 23,
                  ),
                  Expanded(
                    child: Padding(
                      padding: Insets.h12,
                      child: Text(
                        plan.title,
                        style: TextStyles.defaultStyleBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm').format(plan.date),
                    style: TextStyles.defaultStyleBold,
                  )
                ],
              ),
              Padding(
                padding: Insets.v8,
                child: Text(
                  plan.description,
                  textAlign: TextAlign.justify,
                  style: TextStyles.defaultStyleLight,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'components.plans.people'.tr(
                      args: [
                        plan.joinedUsers.length.toString(),
                        plan.maxUsers.toString(),
                      ],
                    ),
                    style: TextStyles.defaultStyle,
                  ),
                  const JoinToPlanButton(isJoined: false), // TODO: logic
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
