import 'package:dio/dio.dart';

abstract class ProfileRemote {
  // TODO: remote methods
}

class ProfileRemoteImpl implements ProfileRemote {
  final Dio dio;
  ProfileRemoteImpl(this.dio);
}
