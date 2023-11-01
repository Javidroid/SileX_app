import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/sign_up/sign_up_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/app_logo.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/forms/pass_field_input.dart';
import 'package:tfg_v2/ui/widgets/components/forms/text_field_input.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool _validated = false; // TODO: validate

  bool _keyboardVisible = false;

  final usernameController = TextEditingController();
  final passController = TextEditingController();

  bool validateInput() {
    return _formKey.currentState!.validate();
  }

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
                      child: Column(
                        children: [
                          state is Error
                              ? ErrorCard(error: state.error)
                              : const Hero(
                                  tag: 'main-logo',
                                  child: AppLogo(size: 75),
                                ),
                          BoxSpacer.v32(),
                        ],
                      ),
                    ),
                  ),
                  TextFieldInput(
                    label: 'SignUp.username'.tr(),
                    hintText: 'SignUp.username_hint'.tr(),
                    controller: usernameController,
                    // TODO: add regex 3-25 chars
                  ),
                  BoxSpacer.v16(),
                  PassFieldInput(
                    label: 'SignUp.password'.tr(),
                    controller: passController,
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'SignUp.forgot_password'.tr(),
                      style: TextStyles.defaultStyle,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () => viewModel.submitSignUp(
                        username: usernameController.text,
                        password: passController.text,
                      ),
                      child: Text(
                        'SignUp.SignUp'.tr(),
                        style: TextStyles.defaultStyleBoldLarge,
                      ),
                    ),
                  ),
                  BoxSpacer.v32(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'SignUp.register_button'.tr(),
                      style: TextStyles.defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }
}
