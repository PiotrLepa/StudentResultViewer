import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/data/network/exception/internal/internal_exception.dart';

@lazySingleton
class ConnectionInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    bool hasConnection = await DataConnectionChecker().hasConnection;

    if (!hasConnection) {
      throw InternalException.noConnection();
    }

    return super.onRequest(options);
  }
}
