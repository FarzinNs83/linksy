import 'package:flutter/material.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/widgets/app_text_field.dart';
import 'package:front/features/settings/presentation/widgets/settings_card.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/settings_tile.dart';

class SettingScreen extends StatefulWidget {
   const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final namectrl = TextEditingController(text: "John Doe");
  final nameNode = FocusNode();
  final userNameCtrl = TextEditingController(text: "@johndoe");
  final usernameNode = FocusNode();
  final emailNode = FocusNode();
  final emailCtrl = TextEditingController(text: "john@email.com");
  final pwNode = FocusNode();
  final pwCtrl = TextEditingController(text: "12345678");
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save_outlined),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Settings",
          style: context.textTheme.headlineSmall!.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(8),
        child: Column(
          children: [

            12.height,
            Text(
              namectrl.text,
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              userNameCtrl.text,
              style: context.textTheme.labelLarge!.copyWith(
                color: context.colors.outline,
              ),
            ),
            25.height,
            SettingsCard(
              child: Column(
                children: [
                  AppTextField(
                    ctrl: namectrl,
                    focusNode: nameNode,
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person_2_outlined),
                    label: "Name",
                  ),
                  12.height,
                  AppTextField(
                    ctrl: userNameCtrl,
                    focusNode: usernameNode,
                    hintText: "Enter Your username",
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    label: "Username",
                  ),
                  12.height,
                  AppTextField(
                    ctrl: emailCtrl,
                    focusNode: emailNode,
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    label: "Email",
                  ),
                  12.height,
                  AppTextField(
                    ctrl: pwCtrl,
                    obsecure: true,
                    focusNode: pwNode,
                    hintText: "Enter Your PW",
                    prefixIcon: Icon(Icons.lock_open),
                    label: "Password",
                  ),
                ],
              ),
            ),

            20.height,
            SettingsCard(
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Dark Mode"),
                    secondary: Icon(Icons.dark_mode),
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            20.height,
            SettingsCard(
              child: Column(
                children: [
                  SettingsTile(
                    icon: Icons.block,
                    title: "Blocked Users",
                    onTap: () {},
                  ),
                  Divider(),
                  SettingsTile(
                    icon: Icons.shield,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),
                  Divider(),
                  SettingsTile(
                    icon: Icons.security,
                    title: "Security",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            30.height,
          ],
        ),
      ),
    );
  }
}
