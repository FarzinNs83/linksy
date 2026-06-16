import 'package:front/features/home/domain/entities/home_entity.dart';

import '../../../home/data/models/home_model.dart';
import '../../domain/repo/profile_repo.dart';
import '../src/profile_remote.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemote remote;
  ProfileRepoImpl(this.remote);

  @override
  Future<HomeEntity> deletePost({required String id}) async {
    return await remote.deletePost(id: id).then((value) => value.toEntity());
  }

  @override
  Future<HomeEntity> publishPost({required String id}) async {
    return await remote.publishPost(id: id).then((value) => value.toEntity());
  }
}
