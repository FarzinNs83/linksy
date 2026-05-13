import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_service.dart';

import '../../data/src/home_remote.dart';
import '../../data/repo/home_repo_impl.dart';
import '../../domain/repo/home_repo.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/entities/home_entity.dart';

part 'home_providers.g.dart';

@riverpod
HomeRemote homeRemote(Ref ref) {
  return HomeRemoteImpl(ref.watch(dioProvider));
}

@riverpod
HomeRepo homeRepo(Ref ref) {
  return HomeRepoImpl(ref.watch(homeRemoteProvider));
}

@riverpod
HomeUseCase homeUseCase(Ref ref) {
  return HomeUseCase(ref.watch(homeRepoProvider));
}

@Riverpod(keepAlive: true)
Future<List<HomeEntity>> home(Ref ref) {
  return ref.watch(homeUseCaseProvider).call();
}
