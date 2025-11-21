

import 'package:dio/dio.dart';

class ApiServices {
  final String baseUrl = '';
  static final ApiServices instance = ApiServices._internal();
  ApiServices._internal();
  late Dio dio;
  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  Future<dynamic> get({required String endPoin}) async {
    Response response = await dio.get(endPoin);
    return response.data;
  }

  
}