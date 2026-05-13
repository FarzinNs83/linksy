import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';

import '../../data/src/settings_remote.dart';
import '../../data/repo/settings_repo_impl.dart';
import '../../domain/repo/settings_repo.dart';
import '../../domain/usecases/settings_usecase.dart';
import '../../domain/entities/settings_entity.dart';

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

@Riverpod(keepAlive: true)
Future<List<SettingsEntity>> settings(Ref ref) {
  return ref.watch(settingsUseCaseProvider).call();
}
