import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/notifications/notifications_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class NotificationsScreen
    extends RootScreen<NotificationsViewState, NotificationsViewModel> {
  const NotificationsScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    NotificationsViewState state,
    NotificationsViewModel viewModel,
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
                Text('Notifications'),
              ],
            ),
          ),
        Error _ => ErrorCard(error: state.error),
      },
    );
  }
}
