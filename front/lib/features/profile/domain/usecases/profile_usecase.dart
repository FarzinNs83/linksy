import '../repo/profile_repo.dart';
import '../entities/profile_entity.dart';

class ProfileUseCase {
  final ProfileRepo repo;
  ProfileUseCase(this.repo);

  Future<List<ProfileEntity>> call() {
    return repo.getAll();
  }
}
