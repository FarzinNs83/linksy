import 'package:flutter/material.dart';
import 'package:front/core/utils/app_ext.dart';

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    this.color, required this.onTap,
  });
  final IconData icon;
  final String title;
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Icon(icon, size: 38, color: color),
          title: Text(
            title,
            style: context.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
