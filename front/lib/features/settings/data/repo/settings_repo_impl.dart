import '../../domain/entities/settings_entity.dart';
import '../../domain/repo/settings_repo.dart';
import '../models/settings_model.dart';
import '../src/settings_remote.dart';

class SettingsRepoImpl implements SettingsRepo {
  final SettingsRemote remote;
  SettingsRepoImpl(this.remote);

  @override
  Future<SettingsEntity> updateUser({
    required String id,
    required SettingsEntity settings,
  }) {
    return remote
        .updateUser(id: id, settings: settings.toModel())
        .then((value) => value.toEntity());
  }
}
