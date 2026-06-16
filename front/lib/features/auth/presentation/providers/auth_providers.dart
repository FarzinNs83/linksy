import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';
import '../../data/src/auth_remote.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/repo/auth_repo.dart';
import '../../domain/usecases/auth_usecase.dart';
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

  Future<void> register(
    String email,
    String pw,
    String name,
    String image,
    String username,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authUseCaseProvider)
          .register(
            email: email,
            pw: pw,
            name: name,
            image: image,
            username: username,
          );
    });
  }

  Future<void> login(String email, String pw) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authUseCaseProvider).login(email: email, pw: pw);
    });
  }
}
