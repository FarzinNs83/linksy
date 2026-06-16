import 'package:front/features/home/data/models/home_model.dart';
import 'package:front/features/home/data/models/user_detail_model.dart';
import 'package:front/features/home/domain/entities/user_detail_entity.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../src/home_remote.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote remote;
  HomeRepoImpl(this.remote);


  @override
  Future<List<HomeEntity>> getPosts() async {
    return await remote.getPosts().then(
      (value) => value.map((e) => e.toEntity()).toList(),
    );
  }
  @override
  Future<void> updateLike() {
    // TODO: implement updateLike
    throw UnimplementedError();
  }
  @override
  Future<UserDetailEntity> getUser({required String id}) async {
    return await remote.getUser(id: id).then((value) => value.toEntity());
  }
}
