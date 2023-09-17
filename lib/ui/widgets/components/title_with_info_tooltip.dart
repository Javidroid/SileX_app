import 'package:flutter/material.dart';
import 'package:info_widget/info_widget.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';

class TitleWithInfoTooltip extends StatelessWidget {
  const TitleWithInfoTooltip({
    super.key,
    required this.title,
    required this.infoTooltip,
  });

  final String title;
  final String infoTooltip;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Insets.a8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.screenAction,
            ),
            InfoWidget(
              infoText: infoTooltip,
              iconData: Icons.help,
              iconColor: colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
