import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/styles/text_styles.dart';

class DeletePlanDialog extends StatelessWidget {
  const DeletePlanDialog({super.key, required this.onAccept});

  TfgNavigator get navigator => getIt<TfgNavigator>();

  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('delete_plan.dialog_title'.tr(), textAlign: TextAlign.center),
      // TODO: put icon?
      content: Text('delete_plan.dialog_content'.tr()),

      actions: <Widget>[
        TextButton(
          onPressed: navigator.pop,
          child: Text('delete_plan.cancel'.tr()),
        ),
        TextButton(
          onPressed: () {
            onAccept();
            // pop twice to not arrive at just deleted plan
            navigator.pop();
            navigator.pop();
          },
          child: Text(
            'delete_plan.accept'.tr(),
            style: TextStyles.cancelTextButton,
          ),
        ),
      ],
    );
  }
}
