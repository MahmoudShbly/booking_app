import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  final int? statusCode;
  final String? errorCode;

  Failure(this.errorMessage, {this.statusCode, this.errorCode});
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, {super.statusCode, super.errorCode});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("انتهت مهلة الاتصال بالخادم.", statusCode: dioError.response?.statusCode);

      case DioExceptionType.sendTimeout:
        return ServerFailure("استغرقت عملية الإرسال وقتاً طويلاً. حاول مرة أخرى.", statusCode: dioError.response?.statusCode);

      case DioExceptionType.receiveTimeout:
        return ServerFailure("لم يتمكن الخادم من إرسال البيانات في الوقت المحدد.", statusCode: dioError.response?.statusCode);

      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure("تم إلغاء الطلب.", statusCode: dioError.response?.statusCode);

      case DioExceptionType.connectionError:
        return ServerFailure("لا يوجد اتصال بالإنترنت.", statusCode: dioError.response?.statusCode);

      default:
        return ServerFailure("حدث خطأ غير متوقع. حاول لاحقاً.", statusCode: dioError.response?.statusCode);
    }
  }

  factory ServerFailure.fromStatusCode(int? statusCode, dynamic data) {
    String message = _getMessageFromStatusCode(statusCode);
    String? errorCode;

    // Try to extract custom message and error code from response data
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) {
        message = data['message'] as String;
      }
      if (data.containsKey('error_code')) {
        errorCode = data['error_code'] as String;
      }
      // Handle validation errors (e.g., Laravel style)
      if (data.containsKey('errors') && data['errors'] is Map) {
        final errors = data['errors'] as Map<String, dynamic>;
        final errorMessages = errors.values.expand((e) => e is List ? e : [e]).cast<String>();
        message = errorMessages.join('\n');
      }
    }

    return ServerFailure(message, statusCode: statusCode, errorCode: errorCode);
  }

  static String _getMessageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "طلب غير صالح.";
      case 401:
        return "غير مصرح لك بتنفيذ هذا الطلب.";
      case 403:
        return "هذا الإجراء محظور.";
      case 404:
        return "لم يتم العثور على المورد المطلوب.";
      case 422:
        return "بيانات الإدخال غير صالحة.";
      case 429:
        return "تم تجاوز حد الطلبات. حاول لاحقاً.";
      case 500:
        return "حدث خطأ في الخادم.";
      case 502:
        return "بوابة سيئة.";
      case 503:
        return "الخدمة غير متوفرة.";
      default:
        return "حدث خطأ غير معروف.";
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errorMessage, {super.statusCode, super.errorCode});

  factory NetworkFailure.noInternet() {
    return NetworkFailure("لا يوجد اتصال بالإنترنت. تحقق من اتصالك وحاول مرة أخرى.");
  }

  factory NetworkFailure.timeout() {
    return NetworkFailure("انتهت مهلة الاتصال. حاول مرة أخرى.");
  }
}

class ValidationFailure extends Failure {
  ValidationFailure(super.errorMessage, {super.statusCode, super.errorCode});

  factory ValidationFailure.invalidInput(String field) {
    return ValidationFailure("الحقل $field غير صالح.");
  }

  factory ValidationFailure.requiredField(String field) {
    return ValidationFailure("الحقل $field مطلوب.");
  }
}

class AuthFailure extends Failure {
  AuthFailure(super.errorMessage, {super.statusCode, super.errorCode});

  factory AuthFailure.invalidCredentials() {
    return AuthFailure("بيانات الدخول غير صحيحة.");
  }

  factory AuthFailure.tokenExpired() {
    return AuthFailure("انتهت صلاحية الجلسة. يرجى تسجيل الدخول مرة أخرى.");
  }

  factory AuthFailure.unauthorized() {
    return AuthFailure("غير مصرح لك بالوصول.");
  }
}
