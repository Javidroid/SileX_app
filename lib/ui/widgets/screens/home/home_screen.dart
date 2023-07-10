import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/screens/home/home_success_screen.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class HomeScreen extends RootScreen<HomeViewState> {
  const HomeScreen({super.key});

  @override
  RootViewModel<HomeViewState> get viewModel => getIt<HomeViewModel>();

  @override
  Widget buildView(BuildContext context, HomeViewState state) {
    return switch (state) {
      Loading _ => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      Success _ => const HomeSuccessScreen(),
      Error _ => Text(state.error.toString()), // todo handle errors
    };
  }
}
