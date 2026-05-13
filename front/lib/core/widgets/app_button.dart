import 'package:flutter/material.dart';

import '../resources/theme/theme_extensions.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final Widget icon;
  final FocusNode focusNode;
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon = const SizedBox(), required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.theme.colorScheme;
    return ElevatedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: textTheme.bodyLarge?.copyWith(color: colors.onPrimary),
          ),
          icon,
        ],
      ),
    );
  }
}
