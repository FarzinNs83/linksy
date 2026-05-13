import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constant/url_const.dart';
part 'dio_service.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      contentType: "application/json",
      baseUrl: UrlConst.base,
      sendTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      
    ),
  );
}
