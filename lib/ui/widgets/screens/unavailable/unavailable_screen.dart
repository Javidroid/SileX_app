import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/unavailable/unavailable_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class UnavailableScreen
    extends RootScreen<UnavailableViewState, UnavailableViewModel> {
  const UnavailableScreen({super.key, required this.error});

  final AppError error;

  @override
  Widget buildView(
    BuildContext context,
    UnavailableViewState state,
    UnavailableViewModel viewModel,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
            Text(
              error is NoInternetError ? 'NO HAY INTERNET' : 'error generico',
            ),
          ],
        ),
      ),
    );
  }
}
