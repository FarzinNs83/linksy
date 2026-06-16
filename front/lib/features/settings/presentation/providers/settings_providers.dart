import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_service.dart';
import '../../../home/presentation/providers/home_providers.dart';
import '../../data/repo/settings_repo_impl.dart';
import '../../data/src/settings_remote.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repo/settings_repo.dart';
import '../../domain/usecases/settings_usecase.dart';

part 'settings_providers.g.dart';

@riverpod
SettingsRemote settingsRemote(Ref ref) {
  return SettingsRemoteImpl(ref.watch(dioProvider));
}

@riverpod
SettingsRepo settingsRepo(Ref ref) {
  return SettingsRepoImpl(ref.watch(settingsRemoteProvider));
}

@riverpod
SettingsUseCase settingsUseCase(Ref ref) {
  return SettingsUseCase(ref.watch(settingsRepoProvider));
}

@riverpod
class UpdateUser extends _$UpdateUser {
  @override
  FutureOr<void> build() {}

  Future<void> updateInfo({
    required String id,
    required SettingsEntity settings,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(settingsUseCaseProvider)
          .updateUser(id: id, settings: settings),
    );

    ref.invalidate(getUserProvider(id));
  }
}
