import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/core/utils/image_picker.dart';
import '../utils/app_ext.dart';

File? imageFile;
class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final PickImage pickImage = PickImage();
    
  Future<void> _pickImage() async {
    final pickedFile = await pickImage.pickImageWithDialog(context);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 65,
            child: ClipOval(
              child: imageFile == null
                  ? SizedBox(
                      width: 120,
                      height: 120,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: context.colors.onPrimary,
                      ),
                    )
                  :
               Image.file(
                imageFile!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.colors.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: context.colors.onPrimary,
                size: 16,
              ),
              onPressed: () => _pickImage(),
            ),
          ),
        ],
      ),
    );
  }
}
