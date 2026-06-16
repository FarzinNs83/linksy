import 'package:dio/dio.dart';

import '../../../../core/constant/url_const.dart';
import '../../../../core/error/app_exception.dart';
import '../../../home/data/models/home_model.dart';

abstract class ProfileRemote {
    Future<HomeModel> publishPost({required String id});
  Future<HomeModel> deletePost({required String id});
}

class ProfileRemoteImpl implements ProfileRemote {
  final Dio dio;
  ProfileRemoteImpl(this.dio);
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
  Future<HomeModel> deletePost({required String id}) async {
    try {
      final response = await dio.delete(
        "${UrlConst.deletePost}$id"
      );
      if (response.statusCode == 200) {
        return HomeModel.fromJson(response.data);
      }
      throw AppException(response.statusMessage.toString());
    } on DioException catch (e) {
      throw AppException(e.response!.data['error']);
    }
  }
}
