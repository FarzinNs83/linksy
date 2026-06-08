import '../repo/home_repo.dart';
import '../entities/home_entity.dart';

class HomeUseCase {
  final HomeRepo repo;
  HomeUseCase(this.repo);

  Future<List<HomeEntity>> getPosts() {
    return repo.getPosts();
  }

  Future<HomeEntity> publishPost({required String id}) {
    return repo.publishPost(id: id);
  }

  Future<HomeEntity> deletePost({required String id}) {
    return repo.deletePost(id: id);
  }
}
