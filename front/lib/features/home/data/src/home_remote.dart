import 'package:dio/dio.dart';
import 'package:front/core/constant/url_const.dart';
import 'package:front/features/home/data/models/home_model.dart';

import '../../../../core/error/app_exception.dart';

abstract class HomeRemote {
  Future<List<HomeModel>> getPosts();
  Future<HomeModel> publishPost({required String id});
  Future<HomeModel> deletePost({required String id});
  Future<List<HomeModel>> updatePost();
  Future<void> updateLike();
}

class HomeRemoteImpl implements HomeRemote {
  final Dio dio;
  HomeRemoteImpl(this.dio);

  @override
  Future<HomeModel> deletePost({required String id}) async {
    try {
      final response = await dio.delete(
        UrlConst.deletePost,
        queryParameters: {'_id': id},
      );
      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      throw AppException(e.response!.data['error']);
    }
  }

  @override
  Future<List<HomeModel>> getPosts() async {
    try {
      final response = await dio.get(UrlConst.getPosts);
      if (response.statusCode == 200) {
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
  Future<HomeModel> publishPost({required String id}) async {
    try {
      final response = await dio.post(UrlConst.publishPost, data: {'_id': id});
      if (response.statusCode == 201) {
        return HomeModel.fromJson(response.data);
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
  Future<List<HomeModel>> updatePost() {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
