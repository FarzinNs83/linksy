import 'package:dio/dio.dart';
import 'package:front/core/constant/url_const.dart';
import 'package:front/features/settings/data/models/settings_model.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../core/error/dio_excp.dart';

abstract class SettingsRemote {
  Future<SettingsModel> updateUser({
    required String id,
    required SettingsModel settings,
  });
}

class SettingsRemoteImpl implements SettingsRemote {
  final Dio dio;
  SettingsRemoteImpl(this.dio);
  
  @override
  Future<SettingsModel> updateUser({required String id, required SettingsModel settings}) async {
    try {
      final response = await dio.put(
        "${UrlConst.updateUser}$id",
        data: settings.toJson(),
      );
      if (response.statusCode == 200) {
        return SettingsModel.fromJson(response.data);
      } 
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      throw dioExcp(e);
    }
  }
}
