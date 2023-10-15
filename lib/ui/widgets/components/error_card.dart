import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key, required this.error});

  final AppError error;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: colorScheme.errorContainer,
      child: Padding(
        padding: Insets.a16,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_rounded),
            BoxSpacer.h16(),
            Text(
              error.message,
              style: TextStyles.errorMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
