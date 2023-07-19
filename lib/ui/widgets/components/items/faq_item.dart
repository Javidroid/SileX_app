import 'package:flutter/material.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.a16,
      child: Column(
        children: [
          Text(
            question,
            style: TextStyles.faqQuestion,
          ),
          Text(
            answer,
            style: TextStyles.faqAnswer,
          ),
          BoxSpacer.v8(),
        ],
      ),
    );
  }
}
