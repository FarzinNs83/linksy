import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';

import '../../data/src/publish_post_remote.dart';
import '../../data/repo/publish_post_repo_impl.dart';
import '../../domain/repo/publish_post_repo.dart';
import '../../domain/usecases/publish_post_usecase.dart';
import '../../domain/entities/publish_post_entity.dart';

part 'publish_post_providers.g.dart';

@riverpod
PublishPostRemote publishpostRemote(Ref ref) {
  return PublishPostRemoteImpl(ref.watch(dioProvider));
}

@riverpod
PublishPostRepo publishpostRepo(Ref ref) {
  return PublishPostRepoImpl(ref.watch(publishpostRemoteProvider));
}

@riverpod
PublishPostUseCase publishpostUseCase(Ref ref) {
  return PublishPostUseCase(ref.watch(publishpostRepoProvider));
}

@riverpod
class PublishPostCtrl extends _$PublishPostCtrl {
  @override
  FutureOr<void> build() {}

  Future<void> publishPost({
    required String uid,
    required String title,
    required String image,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(publishpostUseCaseProvider)
          .publishPost(uid: uid, title: title, image: image),
    );
  }
}
