import '../entities/home_entity.dart';
abstract class HomeRepo {
  Future<List<HomeEntity>> getPosts();
  Future<HomeEntity> publishPost({required String id});
  Future<HomeEntity> deletePost({required String id});
  Future<List<HomeEntity>> updatePost();
  Future<void> updateLike();
}
