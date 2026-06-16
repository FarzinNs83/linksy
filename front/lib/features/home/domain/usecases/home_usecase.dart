import 'package:front/features/home/domain/entities/user_detail_entity.dart';

import '../repo/home_repo.dart';
import '../entities/home_entity.dart';

class HomeUseCase {
  final HomeRepo repo;
  HomeUseCase(this.repo);

  Future<List<HomeEntity>> getPosts() {
    return repo.getPosts();
  }



  Future<UserDetailEntity> getUser({required String id}) {
    return repo.getUser(id: id);
  }
}
