import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:front/core/constant/url_const.dart';
import 'package:front/features/home/data/models/home_model.dart';
import 'package:front/features/home/data/models/user_detail_model.dart';
import '../../../../core/error/app_exception.dart';
import '../../../../core/utils/json_log.dart';

abstract class HomeRemote {
  Future<List<HomeModel>> getPosts();
  Future<UserDetailModel> getUser({required String id});
  Future<void> updateLike();
}

class HomeRemoteImpl implements HomeRemote {
  final Dio dio;
  HomeRemoteImpl(this.dio);

  @override
  Future<List<HomeModel>> getPosts() async {
    try {
      final response = await dio.get(UrlConst.getPosts);
      if (response.statusCode == 200) {
        jsonLog(response.data);
        return (response.data['data'] as List)
            .map((e) => HomeModel.fromJson(e))
            .toList();
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      throw AppException(e.response!.data['error']);
    }
  }

  @override
  Future<void> updateLike() {
    // TODO: implement updateLike
    throw UnimplementedError();
  }

  @override
  Future<UserDetailModel> getUser({required String id}) async {
    try {
      final response = await dio.get("${UrlConst.getUser}$id");
      if (response.statusCode == 200) {
        jsonLog(response.data);
        return UserDetailModel.fromJson(response.data['user']);
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      throw AppException(e.response!.data['error']);
    }
  }
}
