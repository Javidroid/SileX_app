import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/viewmodel/direct_messages/direct_messages_viewmodel.dart';
import 'package:tfg_v2/ui/widgets/components/error_card.dart';
import 'package:tfg_v2/ui/widgets/screens/root_screen.dart';

class MessagesScreen
    extends RootScreen<DirectMessagesViewState, DirectMessagesViewModel> {
  const MessagesScreen({super.key});

  @override
  Widget buildView(
    BuildContext context,
    DirectMessagesViewState state,
    DirectMessagesViewModel viewModel,
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
                Text('Direct Messages'),
              ],
            ),
          ),
        Error _ => ErrorCard(error: state.error),
      },
    );
  }
}
