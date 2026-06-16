import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:front/core/utils/shared_pref_manager.dart';

import '../../../../core/constant/url_const.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/dio_excp.dart';

abstract class AuthRemote {
  Future<void> register({
    required String email,
    required String image,
    required String pw,
    required String name,
    required String username,
  });
  Future<void> login({required String email, required String pw});
}

class AuthRemoteImpl implements AuthRemote {
  final Dio dio;
  AuthRemoteImpl(this.dio);

  @override
  Future<void> login({required String email, required String pw}) async {
    try {
      final response = await dio.post(
        UrlConst.login,
        data: {'email': email, "pw": pw},
      );
      if (response.statusCode == 201) {
        SharedPref.instance.setString('token', response.data['token']);
        SharedPref.instance.setString('userId', response.data['_id']);
        return response.data;
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      log(jsonEncode(e.response!.data));
      throw AppException(e.response!.data['error']);
    }
  }

  @override
  Future<void> register({
    required String email,
    required String image,
    required String pw,
    required String name,
    required String username,
  }) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'pw': pw,
        'name': name,
        'username': username,
        'image': await MultipartFile.fromFile(
          image,
          filename: image.split('/').last,
        ),
      });

      final response = await dio.post(UrlConst.register, data: formData);
      if (response.statusCode == 201) {
        log(jsonEncode(response.data));
        SharedPref.instance.setString('token', response.data['token']);
        SharedPref.instance.setString('userId', response.data['data']['_id']);
        return response.data;
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      log(jsonEncode(e.response!.data));
      dioExcp(e);
    }
  }
}
