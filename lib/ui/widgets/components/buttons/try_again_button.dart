import 'package:flutter/material.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({super.key, this.onTryAgain});

  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTryAgain,
      icon: const Icon(Icons.refresh, color: Colors.white),
      iconSize: 30,
    );
  }
}
