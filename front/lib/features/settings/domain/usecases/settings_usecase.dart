import '../repo/settings_repo.dart';
import '../entities/settings_entity.dart';

class SettingsUseCase {
  final SettingsRepo repo;
  SettingsUseCase(this.repo);

  Future<SettingsEntity> updateUser({required String id, required SettingsEntity settings}) {
    return repo.updateUser(id: id, settings: settings);
  }
}
