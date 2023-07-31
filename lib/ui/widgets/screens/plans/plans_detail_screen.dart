import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key, required this.plan, required this.planId});

  final Plan plan;
  final String planId; // TODO: get plan from remote call

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: plan.title),
      body: ListView(
        padding: Insets.a16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const CircleAvatar(
                  foregroundImage: // todo pic from plan creator
                      AssetImage('assets/images/no_user_pic.png'),
                  radius: 30,
                ),
                onTap: () {}, // TODO: navigate to profile
              ),
              Text(
                plan.place,
                style: TextStyles.defaultStyleBold,
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
              style: TextStyles.defaultStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'components.plans.people'.tr(
                  args: [
                    plan.joinedUsers.toString(),
                    plan.maxUsers.toString(),
                  ],
                ),
                style: TextStyles.defaultStyle,
              ),
              const JoinToPlanButton(isJoined: false),
            ],
          ),
          const Padding(padding: Insets.v12, child: Divider(thickness: 2)),
          Padding(
            padding: Insets.h4,
            child: Text('components.plans.joined_users'.tr()),
          ),
          BoxSpacer.v4(),
          UserList(userList: plan.signedUpUsers),
        ],
      ),
    );
  }
}
