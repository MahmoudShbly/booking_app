import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("انتهت مهلة الاتصال بالخادم.");

      case DioExceptionType.sendTimeout:
        return ServerFailure("استغرقت عملية الإرسال وقتاً طويلاً. حاول مرة أخرى.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("لم يتمكن الخادم من إرسال البيانات في الوقت المحدد.");

      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure("تم إلغاء الطلب.");

      case DioExceptionType.connectionError:
        return ServerFailure("لا يوجد اتصال بالإنترنت.");

      default:
        return ServerFailure("حدث خطأ غير متوقع. حاول لاحقاً.");
    }
  }

  factory ServerFailure.fromStatusCode(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return ServerFailure("طلب غير صالح.");
      case 401:
        return ServerFailure("غير مصرح لك بتنفيذ هذا الطلب.");
      case 403:
        return ServerFailure("هذا الإجراء محظور.");
      case 404:
        return ServerFailure("لم يتم العثور على المورد المطلوب.");
      case 500:
        return ServerFailure("حدث خطأ في الخادم.");
      default:
        return ServerFailure("حدث خطأ غير معروف.");
    }
  }
}
