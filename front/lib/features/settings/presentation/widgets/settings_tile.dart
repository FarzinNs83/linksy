import 'package:flutter/material.dart';
import 'package:front/core/utils/app_ext.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        splashColor: context.colors.primary.withValues(alpha: .2),
        highlightColor: context.colors.primary.withValues(alpha: .1),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}
