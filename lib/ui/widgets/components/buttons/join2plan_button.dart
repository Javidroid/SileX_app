import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/colors.dart';

class JoinToPlanButton extends StatelessWidget {
  const JoinToPlanButton({super.key, required this.isJoined});

  final bool isJoined;

  @override
  Widget build(BuildContext context) {
    return isJoined
        ? ElevatedButton(
            onPressed: () {},
            child: Text('components.buttons.join'.tr()),
          )
        : ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                colorScheme.errorContainer,
              ),
            ),
            child: Text('components.buttons.quit'.tr()),
          );
  }
}
