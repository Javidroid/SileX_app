import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  success,
  warning,
  error,
}

class CustomSnackbar {
  static void show({
    String? title,
    String? body,
    required SnackbarType snackbarType,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        switch (snackbarType) {
          SnackbarType.success => SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: title ?? 'components.snackbar.success.title'.tr(),
                message: body ?? 'components.snackbar.success.body'.tr(),
                contentType: ContentType.success,
              ),
            ),
          SnackbarType.warning => SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: title ?? 'components.snackbar.warning.title'.tr(),
                message: body ?? 'components.snackbar.warning.body'.tr(),
                contentType: ContentType.warning,
              ),
            ),
          SnackbarType.error => SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: title ?? 'components.snackbar.error.title'.tr(),
                message: body ?? 'components.snackbar.error.body'.tr(),
                contentType: ContentType.failure,
              ),
            ),
        },
      );
  }
}
