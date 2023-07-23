import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key});

  // TODO: get plan with viewmodel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'lorem.plan_title'.tr()),
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
            padding: Insets.v8,
            child: Text(
              'lorem.plan_description'.tr(), // todo desc from plan
              textAlign: TextAlign.justify,
              style: TextStyles.defaultStyle,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "x/y personas apuntadas", // todo parameter string
                style: TextStyles.planPreviewBottom,
              ),
              JoinToPlanButton(isJoined: false),
            ],
          ),
          const Padding(padding: Insets.v12, child: Divider(thickness: 2)),
          const Padding(padding: Insets.h4, child: Text("Usuarios apuntados:")),
          BoxSpacer.v4(),
          const UserList(userList: ['user1', 'user2', 'user3']),
        ],
      ),
    );
  }
}
