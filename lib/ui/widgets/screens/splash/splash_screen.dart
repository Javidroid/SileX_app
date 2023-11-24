import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/app_logo.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class SplashScreen extends RootScreen<SplashViewState, SplashViewModel> {
  const SplashScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    SplashViewState state,
    SplashViewModel viewModel,
  ) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: Insets.a20,
          child: switch (state) {
            Loading _ || Success _ => const AppLogo(),
            Error _ => ErrorCard(error: state.error),
          },
        ),
      ),
    );
  }
}
