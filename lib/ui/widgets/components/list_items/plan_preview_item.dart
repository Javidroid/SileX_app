import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join_to_plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/profile/navigable_profile_pic.dart';

class PlanPreviewItem extends StatefulWidget {
  const PlanPreviewItem({
    super.key,
    required this.plan,
    required this.joinButtonBehaviour,
    required this.checkIfJoined,
  });

  TfgNavigator get navigator => getIt<TfgNavigator>();

  final Plan plan;

  final Function({
    required Plan plan,
    required bool isJoin,
  }) joinButtonBehaviour;

  final Function({
    required Plan plan,
  }) checkIfJoined;

  // TODO: pass check joined to plan

  @override
  State<PlanPreviewItem> createState() => _PlanPreviewItemState();
}

class _PlanPreviewItemState extends State<PlanPreviewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.navigator.navigateToPlanDetail(widget.plan),
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
                    asset: widget.plan.creatorProfPic,
                    onTap: () => widget.navigator.navigateToProfile(
                      userRef: widget.plan.creatorId,
                      isUserRefId: true,
                    ),
                    radius: 23,
                  ),
                  Expanded(
                    child: Padding(
                      padding: Insets.h12,
                      child: Text(
                        widget.plan.title,
                        style: TextStyles.defaultStyleBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm').format(widget.plan.date),
                    style: TextStyles.defaultStyleBold,
                  )
                ],
              ),
              Padding(
                padding: Insets.v8,
                child: Text(
                  widget.plan.description,
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
                        widget.plan.joinedUsers.length.toString(),
                        widget.plan.maxUsers.toString(),
                      ],
                    ),
                    style: TextStyles.defaultStyle,
                  ),
                  JoinToPlanButton(
                    isJoined: widget.checkIfJoined(plan: widget.plan),
                    joinBehaviour: () async {
                      await widget.joinButtonBehaviour(
                        plan: widget.plan,
                        isJoin: true,
                      );
                      setState(() {});
                    },
                    quitBehaviour: () async {
                      await widget.joinButtonBehaviour(
                        plan: widget.plan,
                        isJoin: false,
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
