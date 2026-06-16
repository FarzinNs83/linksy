
abstract class AuthRepo {
  Future<void> register({
    required String email,
    required String image,
    required String pw,
    required String name,
    required String username,
  });
  Future<void> login({required String email, required String pw});
}
