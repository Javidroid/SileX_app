import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/join2plan_button.dart';
import 'package:tfg_v2/ui/widgets/components/user_list/user_list.dart';

class PlanDetail extends StatelessWidget {
  const PlanDetail({super.key});

  // TODO: get plan with viewmodel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: Insets.a16,
        child: ListView(
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
                  "x/y personas apuntadas", // todo parameter string
                  style: TextStyles.planPreviewBottom,
                ),
                JoinToPlanButton(isJoined: false),
              ],
            ),
            BoxSpacer.v12(),
            const Divider(),
            BoxSpacer.v12(),
            const Text("Usuarios apuntados: "),
            const UserList(userList: ['user1', 'user2', 'user3']),
          ],
        ),
      ),
    );
  }
}
