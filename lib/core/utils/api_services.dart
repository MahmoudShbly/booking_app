import 'package:booking_app/core/utils/api_end_points.dart';
import 'package:booking_app/core/utils/secure_storage_services.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static final ApiServices instance = ApiServices._internal();
  final storage = SecureStorageServices();

  factory ApiServices() => instance;
  late Dio dio;
  ApiServices._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,

        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  Future<dynamic> get({required String endPoint}) async {
    final token = await storage.getUserToken();
    Response response = await dio.get(
      endPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      ),
    );
    return response.data;
  }

  Future<dynamic> post({required String endPoint, dynamic data}) async {
    final token = await storage.getUserToken();
    Response response = await dio.post(
      endPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          "Accept": "application/json",
        },
      ),
      data: data,
    );

    return response.data;
  }
}
