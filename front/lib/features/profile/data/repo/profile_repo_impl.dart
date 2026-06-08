import '../../domain/entities/profile_entity.dart';
import '../../domain/repo/profile_repo.dart';
import '../src/profile_remote.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemote remote;
  ProfileRepoImpl(this.remote);

  @override
  Future<List<ProfileEntity>> getAll() async {
    // TODO: call remote, map models -> entities
    throw UnimplementedError();
  }
}
