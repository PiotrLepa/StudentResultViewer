import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/core/data/network/serializer/response_converter.dart';
import 'package:student_result_viewer/core/data/network/service/base_network_service.dart';
import 'package:student_result_viewer/data/model/student_result/student_result_model.dart';

@lazySingleton
class NetworkService extends BaseNetworkService {
  NetworkService(
    Dio dio,
    ResponseConverter responseConverter,
  ) : super(dio, responseConverter);

  Future<KtList<StudentResultModel>> getStudentResults() =>
      getList("/students");
}
