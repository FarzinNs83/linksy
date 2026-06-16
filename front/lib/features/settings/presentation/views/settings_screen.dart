import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/utils/dark_mode_notifier.dart';
import 'package:front/core/utils/image_picker.dart';
import 'package:front/core/utils/shared_pref_manager.dart';
import 'package:front/core/widgets/app_text_field.dart';
import 'package:front/core/widgets/show_toast.dart';
import 'package:front/features/home/presentation/providers/home_providers.dart';
import 'package:front/features/settings/domain/entities/settings_entity.dart';
import 'package:front/features/settings/presentation/providers/settings_providers.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_tile.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final namectrl = TextEditingController();
  final nameNode = FocusNode();
  final userNameCtrl = TextEditingController();
  final usernameNode = FocusNode();
  final emailCtrl = TextEditingController();
  final emailNode = FocusNode();
  final PickImage _pickImageUtil = PickImage();
  final _darkModeNotifier = DarkModeNotifier();
  File? _imageFile;
  String? _userId;
  bool _initialized = false;
  SettingsEntity? _currentSettings;

  Future<void> _pickImage() async {
    final pickedFile = await _pickImageUtil.pickImageWithDialog(context);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    namectrl.dispose();
    nameNode.dispose();
    userNameCtrl.dispose();
    usernameNode.dispose();
    emailCtrl.dispose();
    emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = SharedPref.instance.getString('userId') ?? '';
    final user = ref.watch(getUserProvider(userId));
    final updateState = ref.watch(updateUserProvider);

    user.whenData((u) {
      if (!_initialized) {
        _userId = u.id;
        namectrl.text = u.name;
        userNameCtrl.text = u.username;
        emailCtrl.text = u.email ?? '';
        _currentSettings = SettingsEntity(
          id: u.id,
          name: u.name,
          username: u.username,
          email: u.email,
          image: u.image,
        );
        _initialized = true;
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _userId == null
            ? null
            : () async {
                await ref
                    .read(updateUserProvider.notifier)
                    .updateInfo(
                      id: _userId!,
                      settings: _currentSettings!.copyWith(
                        name: namectrl.text,
                        username: userNameCtrl.text,
                        email: emailCtrl.text,
                        image: _imageFile!.path
                      ),
                    );
                ShowToast().show("اطلاعات با موفقیت بروزرسانی شد", context);
              },
        child: updateState is AsyncLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.save_outlined),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Settings",
          style: context.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            12.height,
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: context.colors.primaryContainer,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : (_currentSettings?.image != null &&
                                _currentSettings!.image!.isNotEmpty
                            ? NetworkImage(_currentSettings!.image!)
                                as ImageProvider
                            : null),
                    child: _imageFile == null &&
                            (_currentSettings?.image == null ||
                                _currentSettings!.image!.isEmpty)
                        ? Icon(
                            Icons.person,
                            size: 55,
                            color: context.colors.onPrimaryContainer,
                          )
                        : null,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: context.colors.onPrimary,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
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
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    label: "Name",
                  ),
                  12.height,
                  AppTextField(
                    ctrl: userNameCtrl,
                    focusNode: usernameNode,
                    hintText: "Enter Your username",
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                    label: "Username",
                  ),
                  12.height,
                  AppTextField(
                    ctrl: emailCtrl,
                    focusNode: emailNode,
                    hintText: "Enter Your email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    label: "Email",
                  ),
                ],
              ),
            ),

            20.height,
            ListenableBuilder(
              listenable: _darkModeNotifier,
              builder: (context, _) {
                return SettingsCard(
                  child: Column(
                    children: [
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text("Dark Mode"),
                        secondary: const Icon(Icons.dark_mode),
                        value: _darkModeNotifier.isDark,
                        onChanged: (_) => _darkModeNotifier.toggle(),
                      ),
                    ],
                  ),
                );
              },
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
                  const Divider(),
                  SettingsTile(
                    icon: Icons.shield,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),
                  const Divider(),
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
