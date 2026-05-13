import '../repo/settings_repo.dart';
import '../entities/settings_entity.dart';

class SettingsUseCase {
  final SettingsRepo repo;
  SettingsUseCase(this.repo);

  Future<List<SettingsEntity>> call() {
    return repo.getAll();
  }
}
