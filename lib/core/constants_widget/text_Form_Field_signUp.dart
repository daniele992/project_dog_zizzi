import 'package:flutter/material.dart';

class SingUpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool required;

  const SingUpTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        label: RichText(
          text: TextSpan(
            text: label,
            style: Theme.of(context).inputDecorationTheme.labelStyle ??
                DefaultTextStyle.of(context).style,
            children: required
                ? const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ]
                : [],
          ),
        ),
      ),
    );
  }
}