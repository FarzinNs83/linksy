import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:front/core/constant/url_const.dart';
import 'package:front/core/error/dio_excp.dart';

import '../../../../core/error/app_exception.dart';
import '../models/publish_post_model.dart';

abstract class PublishPostRemote {
  Future<PublishPostModel> publishPost({
    required String uid,
    required String title,
    required String image,
  });
}

class PublishPostRemoteImpl implements PublishPostRemote {
  final Dio dio;
  PublishPostRemoteImpl(this.dio);

  @override
  Future<PublishPostModel> publishPost({
    required String uid,
    required String title,
    required String image,
  }) async {
    try {
      final formData = FormData.fromMap({
        'user': uid,
        'title': title,
        'image': await MultipartFile.fromFile(
          image,
          filename: image.split('/').last,
        ),
      });
      final res = await dio.post(UrlConst.publishPost, data: formData);
      if (res.statusCode == 201) {
        return PublishPostModel.fromJson(res.data['data']);
      }
      throw AppException('Failed to publish post');
    } on DioException catch (e) {
      throw dioExcp(e);
    }
  }
}
