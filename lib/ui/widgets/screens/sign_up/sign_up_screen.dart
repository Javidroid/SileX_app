import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/sign_up/sign_up_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/app_logo.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/forms/user_form.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class SignUpScreen
    extends RootScreenStateful<SignUpViewState, SignUpViewModel> {
  const SignUpScreen({super.key});

  @override
  RootScreenState<SignUpViewState, SignUpViewModel,
          RootScreenStateful<SignUpViewState, SignUpViewModel>>
      createState() => _SignUpScreenState();
}

class _SignUpScreenState extends RootScreenState<SignUpViewState,
    SignUpViewModel, RootScreenStateful<SignUpViewState, SignUpViewModel>> {
  bool _keyboardVisible = false;

  final usernameController = TextEditingController();
  final passController = TextEditingController();
  final mailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final descriptionController = TextEditingController();
  final degreeController = TextEditingController();
  final centerController = TextEditingController();

  @override
  Widget buildView(
    BuildContext context,
    SignUpViewState state,
    SignUpViewModel viewModel,
  ) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: DefaultAppBar(title: 'signup.signup'.tr()),
      body: switch (state) {
        Loading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        Success _ || Error _ => SingleChildScrollView(
            child: Padding(
              padding: Insets.a20,
              child: Column(
                children: [
                  AnimatedScale(
                    scale: _keyboardVisible ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Visibility(
                      visible: !_keyboardVisible,
                      maintainAnimation: true,
                      maintainState: true,
                      child: state is Error
                          ? ErrorCard(error: state.error)
                          : const Hero(
                              tag: 'main-logo',
                              child: AppLogo(size: 75),
                            ),
                    ),
                  ),
                  TextButton(
                    onPressed: viewModel.toLoginScreen,
                    child: Text(
                      'signup.to_login_button'.tr(),
                      style: TextStyles.defaultStyleBold,
                    ),
                  ),
                  BoxSpacer.v16(),
                  UserForm(
                    usernameController: usernameController,
                    passController: passController,
                    mailController: mailController,
                    nameController: nameController,
                    surnameController: surnameController,
                    descriptionController: descriptionController,
                    degreeController: degreeController,
                    centerController: centerController,
                    onSubmit: viewModel.submitSignUp,
                    date: viewModel.date,
                    setDate: viewModel.setDate,
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }
}
