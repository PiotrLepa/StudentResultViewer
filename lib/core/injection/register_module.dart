import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/data/network/interceptor/connection_interceptor.dart';
import 'package:student_result_viewer/core/data/network/network_constant.dart';
import 'package:student_result_viewer/core/injection/injection.dart';

@registerModule
abstract class NetworkClient {
  @lazySingleton
  Dio get dioDefault => Dio()
    ..options.baseUrl = baseUrl
    ..interceptors.add(getIt.get<ConnectionInterceptor>());
}
