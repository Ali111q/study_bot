import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dart_bot/core/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio
      ..options.headers = Constants.headers
      ..options.baseUrl = Constants.apiUrl
      ..interceptors.add(AwesomeDioInterceptor());
  }
}
