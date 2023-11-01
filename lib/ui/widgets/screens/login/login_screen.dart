import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/viewmodel/login/login_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/app_logo.dart';
import 'package:tfg_v2/ui/widgets/components/appbars/default_appbar.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/components/forms/pass_field_input.dart';
import 'package:tfg_v2/ui/widgets/components/forms/text_field_input.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class LoginScreen extends RootScreenStateful<LoginViewState, LoginViewModel> {
  const LoginScreen({super.key});

  @override
  RootScreenState<LoginViewState, LoginViewModel,
          RootScreenStateful<LoginViewState, LoginViewModel>>
      createState() => _LoginScreenState();
}

class _LoginScreenState extends RootScreenState<LoginViewState, LoginViewModel,
    RootScreenStateful<LoginViewState, LoginViewModel>> {
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
    LoginViewState state,
    LoginViewModel viewModel,
  ) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: DefaultAppBar(title: 'login.login'.tr()),
      body: Center(
        child: switch (state) {
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
                                : const AppLogo(withText: true),
                            BoxSpacer.v32(),
                          ],
                        ),
                      ),
                    ),
                    TextFieldInput(
                      label: 'login.username'.tr(),
                      hintText: 'login.username_hint'.tr(),
                      controller: usernameController,
                      // TODO: add regex 3-25 chars
                    ),
                    BoxSpacer.v16(),
                    PassFieldInput(
                      label: 'login.password'.tr(),
                      controller: passController,
                    ),
                    TextButton(
                      onPressed: () {
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: Text(
                        'login.forgot_password'.tr(),
                        style: TextStyles.defaultStyle,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () => viewModel.submitLogin(
                          username: usernameController.text,
                          password: passController.text,
                        ),
                        child: Text(
                          'login.login'.tr(),
                          style: TextStyles.defaultStyleBoldLarge,
                        ),
                      ),
                    ),
                    BoxSpacer.v32(),
                    TextButton(
                      onPressed: viewModel.toRegisterScreen,
                      child: Text(
                        'login.register_button'.tr(),
                        style: TextStyles.defaultStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        },
      ),
    );
  }
}
