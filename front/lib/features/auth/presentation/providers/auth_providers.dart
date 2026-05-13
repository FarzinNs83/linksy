import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';
import '../../data/src/auth_remote.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/repo/auth_repo.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRemote authRemote(Ref ref) {
  return AuthRemoteImpl(ref.watch(dioProvider));
}

@riverpod
AuthRepo authRepo(Ref ref) {
  return AuthRepoImpl(ref.watch(authRemoteProvider));
}

@riverpod
AuthUseCase authUseCase(Ref ref) {
  return AuthUseCase(ref.watch(authRepoProvider));
}

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> register(AuthEntity auth) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authUseCaseProvider).register(auth: auth);
    });
  }

  Future<void> login(String email, String pw) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authUseCaseProvider).login(email: email, pw: pw);
    });
  }
}