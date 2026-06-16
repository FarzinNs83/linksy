import '../../domain/entities/publish_post_entity.dart';
import '../../domain/repo/publish_post_repo.dart';
import '../models/publish_post_model.dart';
import '../src/publish_post_remote.dart';

class PublishPostRepoImpl implements PublishPostRepo {
  final PublishPostRemote remote;
  PublishPostRepoImpl(this.remote);
  
  @override
  Future<PublishPostEntity> publishPost({required String uid, required String title, required String image}) async{
    return await remote.publishPost(uid: uid, title: title, image: image).then((model) => model.toEntity());
  }

}
