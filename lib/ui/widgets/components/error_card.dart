import 'package:flutter/material.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/styles/colors.dart';
import 'package:tfg_v2/ui/styles/insets.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';
import 'package:tfg_v2/ui/widgets/components/box_spacer.dart';
import 'package:tfg_v2/ui/widgets/components/buttons/try_again_button.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key, required this.error, this.onRetry});

  final AppError error;
  final VoidCallback? onRetry;

  bool get isNoInternet => error is NoInternetError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.a16,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: colorScheme.errorContainer,
        child: Padding(
          padding: Insets.a16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isNoInternet
                    ? Icons.signal_wifi_connected_no_internet_4_rounded
                    : Icons.warning_amber_rounded,
                size: 50,
              ),
              BoxSpacer.v16(),
              Text(
                error.message,
                style: TextStyles.noInternetText,
              ),
              if (onRetry != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoxSpacer.v8(),
                    const Divider(thickness: 3),
                    BoxSpacer.v4(),
                    TryAgainButton(
                      onTryAgain: onRetry,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
