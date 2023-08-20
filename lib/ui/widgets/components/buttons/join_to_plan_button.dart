import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/colors.dart';

class JoinToPlanButton extends StatelessWidget {
  const JoinToPlanButton({
    super.key,
    required this.isJoined,
    required this.joinBehaviour,
    required this.quitBehaviour,
  });

  final VoidCallback? joinBehaviour;
  final VoidCallback? quitBehaviour;
  final bool isJoined;

  @override
  Widget build(BuildContext context) {
    return !isJoined
        ? ElevatedButton(
            onPressed: joinBehaviour,
            child: Text('components.buttons.join'.tr()),
          )
        : ElevatedButton(
            onPressed: quitBehaviour,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                colorScheme.errorContainer,
              ),
            ),
            child: Text('components.buttons.quit'.tr()),
          );
  }
}
