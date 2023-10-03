import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.regex,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final String? regex;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if ((value == null) || (value.isEmpty)) {
          return 'create_plan.empty_textfield'.tr();
        }
        if (regex != null) {
          return RegExp(regex!).hasMatch(value)
              ? null
              : 'create_plan.unmatched_regex'.tr();
        }
        return null;
      },
      inputFormatters: [
        if (regex != null)
          FilteringTextInputFormatter.allow(
            RegExp(regex!),
            replacementString: controller.text,
          ),
      ],
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        hintText: hintText,
      ),
    );
  }
}
