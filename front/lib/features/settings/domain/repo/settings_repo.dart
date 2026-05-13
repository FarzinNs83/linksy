import '../entities/settings_entity.dart';

abstract class SettingsRepo {
  // TODO: define contract
  Future<List<SettingsEntity>> getAll();
}
