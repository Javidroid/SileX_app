import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/forms/text_field_input.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';

class CreatePlanInfo extends StatefulWidget {
  const CreatePlanInfo({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.setMaxUsers,
    required this.titleRegex,
    required this.descriptionRegex,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Function(int) setMaxUsers;
  final String titleRegex;
  final String descriptionRegex;

  @override
  State<CreatePlanInfo> createState() => _CreatePlanInfoState();
}

class _CreatePlanInfoState extends State<CreatePlanInfo> {
  int _currentMaxUsers = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'create_plan.plan_info'.tr(),
            infoTooltip: 'create_plan.plan_info_tooltip'.tr(),
          ),
          BoxSpacer.v12(),
          TextFieldInput(
            controller: widget.titleController,
            label: 'create_plan.title_textfield_label'.tr(),
            hintText: 'create_plan.title_textfield_hint'.tr(),
            regex: widget.titleRegex,
          ),
          BoxSpacer.v12(),
          TextFieldInput(
            controller: widget.descriptionController,
            label: 'create_plan.description_textfield_label'.tr(),
            hintText: 'create_plan.description_textfield_hint'.tr(),
            regex: widget.descriptionRegex,
          ),
          BoxSpacer.v12(),
          Text(
            'create_plan.max_users_description'.tr(),
            style: TextStyles.defaultStyleBold,
          ),
          NumberPicker(
            minValue: 2,
            maxValue: 30,
            value: _currentMaxUsers,
            onChanged: (value) => setState(() {
              _currentMaxUsers = value;
              widget.setMaxUsers(value);
            }),
            axis: Axis.horizontal,
            haptics: true,
            infiniteLoop: true,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
            selectedTextStyle: TextStyles.createPlanNumber,
          ),
        ],
      ),
    );
  }
}
