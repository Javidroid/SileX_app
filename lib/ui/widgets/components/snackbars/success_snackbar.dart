import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SuccessSnackbar {
  const SuccessSnackbar();

  void show({
    String? title,
    String? body,
    required BuildContext parentContext,
  }) {
    ScaffoldMessenger.of(parentContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title ?? 'On Snap!', // TODO: define generic message
            message: body ??
                'This is an example message '
                    'that will be shown in the snackbar!',
            contentType: ContentType.success,
          ),
        ),
      );
  }
}
