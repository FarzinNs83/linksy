import '../../domain/entities/auth_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../models/auth_model.dart';
import '../src/auth_remote.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemote remote;
  AuthRepoImpl(this.remote);

  @override
  Future<void> login({required String email, required String pw}) async {
    return await remote.login(email: email, pw: pw);
  }

  @override
  Future<void> register({required AuthEntity auth}) async {
    return await remote.register(auth: auth.toModel());
  }
}
