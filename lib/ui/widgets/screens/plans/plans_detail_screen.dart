import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/plans/plan_detail_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class PlanDetailScreen extends RootScreen<PlanDetailViewState> {
  const PlanDetailScreen({super.key, required this.plan, required this.planId});

  final Plan plan;
  final String planId; // TODO: get plan from remote call with joined user list

  @override
  PlanDetailViewModel get viewModel => PlanDetailViewModel(planId: planId);

  @override
  Widget buildView(BuildContext context, PlanDetailViewState state) {
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
                    plan.joinedUsers.length.toString(),
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
          UserList(userList: plan.joinedUsers),
        ],
      ),
    );
  }
}
