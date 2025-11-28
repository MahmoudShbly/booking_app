

import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:dio/dio.dart';

class ApiServices {

  static final ApiServices instance = ApiServices._internal();
  factory ApiServices() => instance;
  late Dio dio;
  ApiServices._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,

        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
 

  }
 
  Future<dynamic> get({required String endPoint,Map <String,dynamic>? headers}) async {
    Response response = await dio.get(endPoint,options: Options(headers: headers));
    return response.data;
  }

  
}