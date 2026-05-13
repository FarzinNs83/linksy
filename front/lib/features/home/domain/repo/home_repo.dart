import '../entities/home_entity.dart';

abstract class HomeRepo {
  // TODO: define contract
  Future<List<HomeEntity>> getAll();
}
