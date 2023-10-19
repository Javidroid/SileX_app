import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/login/login_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class LoginScreen extends RootScreen<LoginViewState, LoginViewModel> {
  const LoginScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    LoginViewState state,
    LoginViewModel viewModel,
  ) {
    return Scaffold(
      body: switch (state) {
        Loading _ => const Center(
            child: CircularProgressIndicator(),
          ),
        Success _ => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Login'),
              ],
            ),
          ),
        Error _ => ErrorCard(error: state.error),
      },
    );
  }
}
