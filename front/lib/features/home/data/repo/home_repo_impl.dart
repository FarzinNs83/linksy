import '../../domain/entities/home_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../src/home_remote.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote remote;
  HomeRepoImpl(this.remote);

  @override
  Future<List<HomeEntity>> getAll() async {
    // TODO: call remote, map models -> entities
    throw UnimplementedError();
  }
}
