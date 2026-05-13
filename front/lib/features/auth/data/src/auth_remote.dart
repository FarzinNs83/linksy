import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constant/url_const.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/error/dio_excp.dart';
import '../models/auth_model.dart';

abstract class AuthRemote {
  Future<void> register({required AuthModel auth});
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
        log(jsonEncode(response.data));
        return response.data;
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      log(jsonEncode(e.response!.data));
      throw AppException(e.response!.data['error']);
    }
  }

  @override
  Future<void> register({required AuthModel auth}) async {
    try {
      final response = await dio.post(UrlConst.register, data: auth);
      if (response.statusCode == 201) {
        log(jsonEncode(response.data));
        return response.data;
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      dioExcp(e);
    }
  }
}
