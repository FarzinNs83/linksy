import '../../../home/domain/entities/home_entity.dart';

abstract class ProfileRepo {
  Future<HomeEntity> publishPost({required String id});
  Future<HomeEntity> deletePost({required String id});
}
