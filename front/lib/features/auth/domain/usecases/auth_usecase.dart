import 'package:image_picker/image_picker.dart';

import '../../../../core/error/app_exception.dart';
import '../repo/auth_repo.dart';
import '../entities/auth_entity.dart';

class AuthUseCase {
  final AuthRepo repo;
  AuthUseCase(this.repo);

  Future<void> register({
    required String email,
    required String pw,
    required String name,
    required String image,
  }) async {
    return repo.register(email: email, pw: pw, name: name, image: image);
  }

  Future<void> login({required String email, required String pw}) async {
    // _validateLogin(email,pw);
    return repo.login(email: email, pw: pw);
  }

  void _validateLogin(String email, String pw) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (email.trim().isEmpty) {
      throw AppException("Email is Required");
    }
    if (!emailRegex.hasMatch(email)) {
      throw AppException("Email Format is Not Correct");
    }
    if (pw.trim().isEmpty) {
      throw AppException("Password is Required");
    }
    if (pw.trim().length < 8) {
      throw AppException("Password should atleast Have 8 Characters");
    }
  }
}
