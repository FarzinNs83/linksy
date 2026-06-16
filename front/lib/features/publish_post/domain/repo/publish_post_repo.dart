import '../entities/publish_post_entity.dart';

abstract class PublishPostRepo {
  Future<PublishPostEntity> publishPost({required String uid, required String title, required String image});
}
