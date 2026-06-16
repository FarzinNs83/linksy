import '../../domain/repo/auth_repo.dart';
import '../src/auth_remote.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemote remote;
  AuthRepoImpl(this.remote);

  @override
  Future<void> login({required String email, required String pw}) async {
    return await remote.login(email: email, pw: pw);
  }

  @override
  Future<void> register({
    required String email,
    required String image,
    required String pw,
    required String name,
    required String username,
  }) async {
    return await remote.register(
      email: email,
      image: image,
      pw: pw,
      name: name,
      username: username,
    );
  }
}
