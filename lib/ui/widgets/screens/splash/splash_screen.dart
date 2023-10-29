import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart';
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
        child: switch (state) {
          // TODO: set splash
          Loading _ => Image.asset('assets/images/logo.png'),
          Success _ => Image.asset('assets/images/logo.png'),
          Error _ => ErrorCard(error: state.error),
        },
      ),
    );
  }
}
