import '../../../home/domain/entities/home_entity.dart';
import '../repo/profile_repo.dart';
import '../entities/profile_entity.dart';

class ProfileUseCase {
  final ProfileRepo repo;
  ProfileUseCase(this.repo);

  Future<HomeEntity> publishPost({required String id}) {
    return repo.publishPost(id: id);
  }

  Future<HomeEntity> deletePost({required String id}) {
    return repo.deletePost(id: id);
  }
}
