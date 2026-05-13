import '../entities/auth_entity.dart';

abstract class AuthRepo {
  Future<void> register({required AuthEntity auth});
  Future<void> login({required String email, required String pw});
}
