import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/common/logger/logger.dart';
import 'package:student_result_viewer/core/data/network/exception/api/api_exception.dart';
import 'package:student_result_viewer/core/data/network/exception/internal/internal_exception.dart'
    as internalException;
import 'package:student_result_viewer/core/injection/injection.dart';

@lazySingleton
class NetworkErrorHandler {
  Future<T> handleError<T>(dynamic error, StackTrace stackTrace) async {
    logger.e("NetworkErrorHandler", error, stackTrace);
    if (error is DioError) {
      final apiException = _mapError(error);
      return Future.error(apiException);
    } else {
      return Future.error(ApiException.unknownError(-1));
    }
  }

  ApiException _mapError(DioError dioError) {
    final error = dioError.error;
    if (error is internalException.NoConnection) {
      return ApiException.noConnection(-1);
    }
    final response = dioError.response;
    final statusCode = response?.statusCode;
    try {
      final data = response.data;
      convertModelCodePropertyToInt(data);
      final exception = _mapToApiException(statusCode);
      return exception;
    } on TypeError catch (e) {
      logger.e(e);
      return ApiException.unknownError(statusCode);
    } catch (e) {
      logger.e(e);
      return ApiException.unknownError(statusCode);
    }
  }

  dynamic convertModelCodePropertyToInt(data) {
    final code = data["code"];
    if (code is String) {
      data["code"] = int.parse(data["code"]);
    }
  }

  ApiException _mapToApiException(int statusCode) {
    switch (statusCode) {
      case 400:
        return ApiException.badRequest(statusCode);
      case 500:
        return ApiException.internalServerError(statusCode);
      default:
        return ApiException.unknownError(statusCode);
    }
  }
}

extension FutureExtension<T> on Future<T> {
  Future<T> handleNetworkError<T>() {
    final errorHandler = getIt<NetworkErrorHandler>();
    return catchError((e, s) => errorHandler.handleError<T>(e, s)) as Future<T>;
  }
}
