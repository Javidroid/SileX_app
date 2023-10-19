import 'package:easy_localization/easy_localization.dart';
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
    return Card(
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
              isNoInternet ? 'errors.no_internet'.tr() : 'errors.generic'.tr(),
              style: TextStyles.noInternetText,
            ),
            if (onRetry != null)
              Column(
                children: [
                  BoxSpacer.v16(),
                  TryAgainButton(
                    onTryAgain: onRetry,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
