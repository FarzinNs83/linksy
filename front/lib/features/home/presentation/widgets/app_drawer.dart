import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/features/home/presentation/views/home_screen.dart';

import '../../../../core/utils/app_ext.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/views/login_screen.dart';
import '../../../profile/presentation/views/profile_screen.dart';
import '../../../settings/presentation/views/settings_screen.dart';
import 'app_drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.onPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 160,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(Assets.png.profile.path, fit: BoxFit.cover),
              ),
            ),
            12.height,
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Farzin Nasiri",
                  speed: Duration(milliseconds: 150),
                  textStyle: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              totalRepeatCount: 1,
            ),
            12.height,
            Divider(indent: 10, endIndent: 10),
            12.height,
            AppDrawerTile(
              icon: Icons.home_outlined,
              title: "H O M E",
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.navigateR(HomeScreen());
              },
            ),
            AppDrawerTile(
              icon: Icons.person_outlined,
              title: "P R O F I L E",
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.navigate(ProfileScreen());
              },
            ),
            AppDrawerTile(
              icon: Icons.settings_outlined,
              title: "S E T T I N G S",
              onTap: () {
                Scaffold.of(context).closeDrawer();
                context.navigate(SettingScreen());
              },
            ),
            Spacer(),
            AppDrawerTile(
              icon: Icons.logout_outlined,
              title: "L O G O U T",
              color: context.colors.error,
              onTap: () => context.navigateR(LoginScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
