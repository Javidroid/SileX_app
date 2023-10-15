import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/home/home_success_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class HomeScreen extends RootScreen<HomeViewState, HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    HomeViewState state,
    HomeViewModel viewModel,
  ) {
    return switch (state) {
      Loading _ => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      Success _ => HomeSuccessScreen(loggedUser: state.loggedUser),
      Error _ => ErrorCard(error: state.error),
    };
  }
}
