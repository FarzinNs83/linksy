import 'dart:io';
import 'package:dio/dio.dart';
import 'app_exception.dart';

DioException dioExcp(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw AppException(
        'زمان اتصال به سرور به پایان رسید. اینترنت را بررسی کنید و دوباره تلاش کنید.',
      );

    case DioExceptionType.badCertificate:
      throw AppException(
        'گواهی امنیتی سرور معتبر نیست.',
      );

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 400:
          throw AppException('درخواست نامعتبر است.');
        case 401:
          throw AppException('دسترسی غیرمجاز. لطفاً دوباره وارد شوید.');
        case 403:
          throw AppException('شما اجازه دسترسی به این بخش را ندارید.');
        case 404:
          throw AppException('موردی یافت نشد.');
        case 500:
          throw AppException('خطای داخلی سرور رخ داده است.');
        case 503:
          throw AppException('سرور در حال حاضر در دسترس نیست.');
        default:
          throw AppException(
            'خطای سرور رخ داد. (کد: ${statusCode ?? 'نامشخص'})',
          );
      }

    case DioExceptionType.cancel:
      throw AppException('درخواست لغو شد.');

    case DioExceptionType.connectionError:
      if (e.error is SocketException) {
        throw AppException('اینترنت در دسترس نیست.');
      }
      throw AppException('خطا در برقراری ارتباط با سرور.');

    case DioExceptionType.unknown:
      if (e.error is SocketException) {
        throw AppException('اینترنت در دسترس نیست.');
      }
      throw AppException('خطای غیرمنتظره‌ای رخ داد.');
  }
}