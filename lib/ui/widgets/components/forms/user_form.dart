import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/forms/pass_field_input.dart';
import 'package:tfg_v2/ui/widgets/components/forms/text_field_input.dart';
import 'package:tfg_v2/ui/widgets/components/title_with_info_tooltip.dart';
import 'package:tfg_v2/utils/datetime_utils.dart';

class UserForm extends StatefulWidget {
  const UserForm({
    super.key,
    required this.usernameController,
    required this.passController,
    required this.mailController,
    required this.nameController,
    required this.surnamesController,
    required this.descriptionController,
    required this.degreeController,
    required this.centerController,
    required this.onSubmit,
  });

  final Function({
    required String center,
    required String degree,
    required DateTime birthday,
    required String description,
    required String email,
    required String name,
    required String password,
    required String surnames,
    required String username,
  }) onSubmit; // TODO: specify function

  final TextEditingController usernameController,
      passController,
      mailController,
      nameController,
      surnamesController,
      descriptionController,
      degreeController,
      centerController;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  bool _validated = false; // TODO: validate

  DateTime _date = DateTime.now();

  bool validateInput() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () => setState(() => _validated = validateInput()),
      child: Column(
        children: [
          TitleWithInfoTooltip(
            title: 'signup.core_data_title'.tr(),
            infoTooltip: 'signup.core_data_tooltip'.tr(),
          ),
          BoxSpacer.v8(),
          TextFieldInput(
            label: 'signup.username'.tr(),
            hintText: 'signup.username_hint'.tr(),
            controller: widget.usernameController,
            // TODO: add regex 3-25 chars
          ),
          BoxSpacer.v16(),
          TextFieldInput(
            label: 'signup.mail'.tr(),
            controller: widget.mailController,
          ),
          BoxSpacer.v16(),
          PassFieldInput(
            label: 'signup.password'.tr(),
            controller: widget.passController,
          ),
          BoxSpacer.v24(),
          TitleWithInfoTooltip(
            title: 'signup.user_info_title'.tr(),
            infoTooltip: 'signup.user_info_tooltip'.tr(),
          ),
          BoxSpacer.v8(),
          TextFieldInput(
            label: 'signup.name'.tr(),
            controller: widget.nameController,
          ),
          BoxSpacer.v16(),
          TextFieldInput(
            label: 'signup.surname'.tr(),
            controller: widget.surnamesController,
          ),
          BoxSpacer.v16(),
          TextFieldInput(
            label: 'signup.description'.tr(),
            controller: widget.descriptionController,
          ),
          BoxSpacer.v16(),
          Row(
            children: [
              BoxSpacer.h8(),
              Text('signup.birthday'.tr(), style: TextStyles.defaultStyleBold),
              TextButton(
                child: Row(
                  children: [
                    Text(
                      DateTimeUtils.dateTimeToString(
                        date: _date,
                        appendWeekday: false,
                      ),
                      style: TextStyles.createPlanTextButton,
                    ),
                    BoxSpacer.h8(),
                    const Icon(Icons.edit),
                  ],
                ),
                onPressed: () async {
                  _date = await showDatePicker(
                        context: context,
                        initialEntryMode: DatePickerEntryMode.inputOnly,
                        initialDate: _date,
                        firstDate: DateTime(
                          DateTime.now().year - 75,
                        ),
                        lastDate: DateTime.now(),
                      ) ??
                      DateTime.now();
                },
              ),
            ],
          ),
          BoxSpacer.v16(),
          TextFieldInput(
            label: 'signup.degree'.tr(),
            controller: widget.degreeController,
          ),
          BoxSpacer.v16(),
          TextFieldInput(
            label: 'signup.center'.tr(),
            controller: widget.centerController,
          ),
          BoxSpacer.v24(),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: _validated
                  ? () => widget.onSubmit(
                        username: widget.usernameController.text,
                        password: widget.passController.text,
                        email: widget.mailController.text,
                        description: widget.descriptionController.text,
                        birthday: _date,
                        center: widget.centerController.text,
                        degree: widget.degreeController.text,
                        name: widget.nameController.text,
                        surnames: widget.surnamesController.text,
                      )
                  : null,
              child: Text(
                'signup.signup'.tr(),
                style: TextStyles.defaultStyleBoldLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
