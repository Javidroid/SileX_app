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
            child: const Text("Unirse"),
          )
        : ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                colorScheme.errorContainer,
              ),
            ),
            child: const Text("Desapuntarse"),
          );
  }
}
