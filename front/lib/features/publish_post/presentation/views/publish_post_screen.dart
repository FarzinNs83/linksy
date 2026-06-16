import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_ext.dart';
import '../../../../core/utils/image_picker.dart';
import '../../../../core/utils/shared_pref_manager.dart';
import '../../../../core/widgets/show_toast.dart';
import '../providers/publish_post_providers.dart';

class PublishPostScreen extends ConsumerStatefulWidget {
  const PublishPostScreen({super.key});

  @override
  ConsumerState<PublishPostScreen> createState() => _PublishPostScreenState();
}

class _PublishPostScreenState extends ConsumerState<PublishPostScreen> {
  final _pickImageUtil = PickImage();
  final _titleController = TextEditingController();
  final _titleFocusNode = FocusNode();
  File? _imageFile;

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _pickImageUtil.pickImageWithDialog(context);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  void _publish() {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select an image'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please add a caption'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    final userId = SharedPref.instance.getString('userId') ?? '';
    ref.read(publishPostCtrlProvider.notifier).publishPost(
          uid: userId,
          title: _titleController.text.trim(),
          image: _imageFile!.path,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(publishPostCtrlProvider);
    final colors = context.colors;
    final textTheme = context.textTheme;

    ref.listen(publishPostCtrlProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: colors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
        data: (_) {
          if (previous is AsyncLoading) {
            setState(() {
              _imageFile = null;
              _titleController.clear();
            });
            ShowToast().show('Post published successfully!', context);
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close_rounded),
        ),
        title: Text(
          'New Post',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          _PublishButton(
            isLoading: state.isLoading,
            onPressed: _publish,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImagePickerSection(
              imageFile: _imageFile,
              onTap: _pickImage,
              onRemove: () => setState(() => _imageFile = null),
            ),
            Divider(height: 1, color: colors.outlineVariant),
            _CaptionSection(
              controller: _titleController,
              focusNode: _titleFocusNode,
            ),
            Divider(height: 1, color: colors.outlineVariant),
            16.height,
            _ActionRow(
              onLocationTap: () {},
              onTagPeopleTap: () {},
              onMusicTap: () {},
            ),
            Divider(height: 1, color: colors.outlineVariant),
            _AdvancedOptions(
              onAdvancedTap: () {},
            ),
            100.height,
          ],
        ),
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _PublishButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.onPrimary,
                ),
              )
            : const Text(
                'Share',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
      ),
    );
  }
}

class _ImagePickerSection extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _ImagePickerSection({
    required this.imageFile,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: context.screenHeight * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
      child: imageFile != null
          ? _BuildImagePreview(
              imageFile: imageFile!,
              onRemove: onRemove,
            )
          : _BuildImagePlaceholder(onTap: onTap),
    );
  }
}

class _BuildImagePreview extends StatelessWidget {
  final File imageFile;
  final VoidCallback onRemove;

  const _BuildImagePreview({
    required this.imageFile,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      fit: StackFit.expand,
      children: [
        FadeIn(
          duration: const Duration(milliseconds: 400),
          child: Image.file(
            imageFile,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: BounceInDown(
            from: 20,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: colors.onPrimary,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideInUp(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: colors.primary, size: 20),
                  8.width,
                  Text(
                    'Image selected',
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: colors.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildImagePlaceholder extends StatelessWidget {
  final VoidCallback onTap;

  const _BuildImagePlaceholder({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.primaryContainer.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: 48,
                color: colors.primary,
              ),
            ),
          ),
          16.height,
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Tap to add a photo',
              style: textTheme.titleMedium?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          8.height,
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Text(
              'or drag and drop an image here',
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ),
          24.height,
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SourceChip(
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  onTap: onTap,
                ),
                12.width,
                _SourceChip(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SourceChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SourceChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colors.outlineVariant,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: colors.onSurface.withValues(alpha: 0.7),
            ),
            6.width,
            Text(
              label,
              style: TextStyle(
                color: colors.onSurface.withValues(alpha: 0.8),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaptionSection extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const _CaptionSection({
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.shade400,
                  Colors.pink.shade400,
                  Colors.orange.shade400,
                ],
              ),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.surface,
              ),
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: colors.primaryContainer,
                child: Icon(Icons.person, size: 18, color: colors.primary),
              ),
            ),
          ),
          12.width,
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              maxLines: null,
              minLines: 2,
              maxLength: 500,
              textInputAction: TextInputAction.newline,
              style: textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Write a caption...',
                hintStyle: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.4),
                ),
                border: InputBorder.none,
                counterStyle: TextStyle(
                  color: colors.onSurface.withValues(alpha: 0.4),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final VoidCallback onLocationTap;
  final VoidCallback onTagPeopleTap;
  final VoidCallback onMusicTap;

  const _ActionRow({
    required this.onLocationTap,
    required this.onTagPeopleTap,
    required this.onMusicTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        _ActionTile(
          icon: Icons.location_on_outlined,
          title: 'Add location',
          onTap: onLocationTap,
        ),
        Divider(
          height: 1,
          indent: 56,
          color: colors.outlineVariant.withValues(alpha: 0.5),
        ),
        _ActionTile(
          icon: Icons.person_add_outlined,
          title: 'Tag people',
          onTap: onTagPeopleTap,
        ),
        Divider(
          height: 1,
          indent: 56,
          color: colors.outlineVariant.withValues(alpha: 0.5),
        ),
        _ActionTile(
          icon: Icons.music_note_outlined,
          title: 'Add music',
          onTap: onMusicTap,
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: colors.onSurface),
            14.width,
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurface,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: colors.onSurface.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdvancedOptions extends StatelessWidget {
  final VoidCallback onAdvancedTap;

  const _AdvancedOptions({required this.onAdvancedTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return InkWell(
      onTap: onAdvancedTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(
              Icons.settings_outlined,
              size: 22,
              color: colors.onSurface,
            ),
            14.width,
            Text(
              'Advanced settings',
              style: textTheme.bodyLarge?.copyWith(
                color: colors.onSurface,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: colors.onSurface.withValues(alpha: 0.4),
            ),
          ],
        ),
      ),
    );
  }
}
