import 'package:dio/dio.dart';

abstract class SettingsRemote {
  // TODO: remote methods
}

class SettingsRemoteImpl implements SettingsRemote {
  final Dio dio;
  SettingsRemoteImpl(this.dio);
}
