import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';

import '../../data/src/profile_remote.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../../domain/repo/profile_repo.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileRemote profileRemote(Ref ref) {
  return ProfileRemoteImpl(ref.watch(dioProvider));
}

@riverpod
ProfileRepo profileRepo(Ref ref) {
  return ProfileRepoImpl(ref.watch(profileRemoteProvider));
}

@riverpod
ProfileUseCase profileUseCase(Ref ref) {
  return ProfileUseCase(ref.watch(profileRepoProvider));
}

@Riverpod(keepAlive: true)
Future<List<ProfileEntity>> profile(Ref ref) {
  return ref.watch(profileUseCaseProvider).call();
}
