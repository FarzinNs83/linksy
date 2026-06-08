import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class PickImage {
  final picker = ImagePicker();
  Future<XFile?> pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      return pickedFile;
    } catch (e) {
      log('Error picking image: $e');
      return null;
    }
  }
}