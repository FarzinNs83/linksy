import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController ctrl;
  final TextInputType? keyboardType;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final String hintText;
  final Widget prefixIcon;
  final bool obsecure;
  final String label;
  const AppTextField({
    super.key,
    this.validator,
    required this.ctrl,
    this.keyboardType,
    required this.focusNode,
    this.nextFocus,
    required this.hintText,
    required this.prefixIcon,
    this.obsecure = false, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      validator: validator,
      controller: ctrl,
      keyboardType: keyboardType,
      focusNode: focusNode,
      
      onFieldSubmitted: (_) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      decoration: InputDecoration(hintText: hintText, prefixIcon: prefixIcon,labelText: label),
    );
  }
}
