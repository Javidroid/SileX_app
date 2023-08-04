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
  const PlanDetailScreen({super.key, required this.plan});

  final Plan plan;

  // TODO: ver si juntar el enlace a la foto de perfil al plan,
  //      crear un método para obtener solo la foto de perfil del user
  //      o directamente pillar el user junto al plan para redirigir

  @override
  PlanDetailViewModel get viewModel => PlanDetailViewModel(planFromList: plan);

  @override
  Widget buildView(BuildContext context, PlanDetailViewState state) {
    return Scaffold(
      appBar:
          DefaultAppBar(title: (state is Success) ? state.plan.title : null),
      body: switch (state) {
        (Loading _ || Success _) => ListView(
            padding: Insets.a16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const CircleAvatar(
                      foregroundImage: // todo pic from plan creator
                          NetworkImage('https://via.placeholder.com/250'),
                      radius: 30,
                    ),
                    onTap: () {}, // TODO: navigate to profile
                  ),
                  Text(
                    state.plan.place,
                    style: TextStyles.defaultStyleBold,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy, kk:mm').format(state.plan.date),
                    style: TextStyles.defaultStyleBold,
                  )
                ],
              ),
              Padding(
                padding: Insets.v8,
                child: Text(
                  state.plan.description,
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
                        state.plan.joinedUsers.length.toString(),
                        state.plan.maxUsers.toString(),
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
              (state is Success)
                  ? UserList(userList: state.plan.joinedUsers)
                  : const Center(child: CircularProgressIndicator()),
              // todo improve UI to not use circular progress
            ],
          ),
        Error _ => Text(state.error.toString()), // todo handle errors
      },
    );
  }
}
