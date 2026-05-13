import 'package:dio/dio.dart';

abstract class HomeRemote {
  // TODO: remote methods
}

class HomeRemoteImpl implements HomeRemote {
  final Dio dio;
  HomeRemoteImpl(this.dio);
}
