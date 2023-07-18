import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';

class ProfileNumberButton extends StatelessWidget {
  const ProfileNumberButton({
    super.key,
    required this.value,
    required this.text,
  });

  final int value;
  final String text;

  // todo: make generic enum types

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {}, // todo: send to follows list screen
      child: Column(
        children: <Widget>[
          Text(
            value.toString(),
            style: TextStyles.profileNumberButton,
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: TextStyles.defaultStyleLight,
          ),
        ],
      ),
    );
  }
}
