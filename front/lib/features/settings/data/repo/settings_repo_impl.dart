import '../../domain/entities/settings_entity.dart';
import '../../domain/repo/settings_repo.dart';
import '../src/settings_remote.dart';

class SettingsRepoImpl implements SettingsRepo {
  final SettingsRemote remote;
  SettingsRepoImpl(this.remote);

  @override
  Future<List<SettingsEntity>> getAll() async {
    // TODO: call remote, map models -> entities
    throw UnimplementedError();
  }
}
