import '../repo/home_repo.dart';
import '../entities/home_entity.dart';

class HomeUseCase {
  final HomeRepo repo;
  HomeUseCase(this.repo);

  Future<List<HomeEntity>> call() {
    return repo.getAll();
  }
}
