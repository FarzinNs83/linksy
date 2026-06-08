import '../entities/profile_entity.dart';

abstract class ProfileRepo {
  // TODO: define contract
  Future<List<ProfileEntity>> getAll();
}
