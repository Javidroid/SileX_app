import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassFieldInput extends StatefulWidget {
  const PassFieldInput({
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
  State<PassFieldInput> createState() => _PassFieldInputState();
}

class _PassFieldInputState extends State<PassFieldInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if ((value == null) || (value.isEmpty)) {
          return 'create_plan.empty_textfield'.tr();
        }
        if (widget.regex != null && widget.regex!.isNotEmpty) {
          return RegExp(widget.regex!).hasMatch(value)
              ? null
              : 'create_plan.unmatched_regex'.tr();
        }
        return null;
      },
      inputFormatters: [
        if (widget.regex != null)
          FilteringTextInputFormatter.allow(
            RegExp(widget.regex!),
            replacementString: widget.controller.text,
          ),
      ],
      obscureText: _obscure,
      decoration: InputDecoration(
        labelText: widget.label,
        alignLabelWithHint: true,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      ),
    );
  }
}
