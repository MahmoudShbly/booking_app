

import 'package:dio/dio.dart';

class ApiServices {
  final String baseUrl = '';
  static final ApiServices instance = ApiServices._internal();
  factory ApiServices() => instance;
  late Dio dio;
  ApiServices._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

  }
 
  Future<dynamic> get({required String endPoin}) async {
    Response response = await dio.get(endPoin);
    return response.data;
  }

  
}