import '../repo/publish_post_repo.dart';
import '../entities/publish_post_entity.dart';

class PublishPostUseCase {
  final PublishPostRepo repo;
  PublishPostUseCase(this.repo);

  Future<PublishPostEntity> publishPost({required String uid, required String title, required String image}) {
    return repo.publishPost(uid: uid, title: title, image: image);
  }
}
