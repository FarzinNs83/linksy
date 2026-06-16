import '../entities/settings_entity.dart';

abstract class SettingsRepo {
  Future<SettingsEntity> updateUser({required String id, required SettingsEntity settings});
}
