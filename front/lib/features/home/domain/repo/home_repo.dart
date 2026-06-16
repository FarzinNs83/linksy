import '../entities/home_entity.dart';
import '../entities/user_detail_entity.dart';
abstract class HomeRepo {
  Future<List<HomeEntity>> getPosts();
  Future<UserDetailEntity> getUser({required String id});
  Future<void> updateLike();
}
