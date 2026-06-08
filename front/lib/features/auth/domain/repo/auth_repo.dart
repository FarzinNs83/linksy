
abstract class AuthRepo {
  Future<void> register({
    required String email,
    required String image,
    required String pw,
    required String name,
  });
  Future<void> login({required String email, required String pw});
}
