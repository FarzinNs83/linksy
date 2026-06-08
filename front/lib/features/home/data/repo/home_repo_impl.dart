import 'package:front/features/home/data/models/home_model.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/repo/home_repo.dart';
import '../src/home_remote.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote remote;
  HomeRepoImpl(this.remote);

  @override
  Future<HomeEntity> deletePost({required String id}) async {
    return await remote.deletePost(id: id).then((value) => value.toEntity());
  }

  @override
  Future<List<HomeEntity>> getPosts() async {
    return await remote.getPosts().then(
      (value) => value.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<HomeEntity> publishPost({required String id}) async {
    return await remote.publishPost(id: id).then((value) => value.toEntity());
  }

  @override
  Future<void> updateLike() {
    // TODO: implement updateLike
    throw UnimplementedError();
  }

  @override
  Future<List<HomeEntity>> updatePost() {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
