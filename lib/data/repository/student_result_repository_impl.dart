import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/core/data/mapper/entity_mapper.dart';
import 'package:student_result_viewer/core/data/network/network_error_handler.dart';
import 'package:student_result_viewer/data/model/student_result/student_result_model.dart';
import 'package:student_result_viewer/data/service/network_service.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/repository/student_result_repository.dart';

@RegisterAs(StudentResultRepository)
@lazySingleton
class StudentResultRepositoryImpl implements StudentResultRepository {
  final NetworkService _service;
  final EntityMapper<StudentResult, StudentResultModel>
      _studentResultEntityMapper;

  StudentResultRepositoryImpl(
    this._service,
    this._studentResultEntityMapper,
  );

  @override
  Future<KtList<StudentResult>> getStudentResults() => _service
      .getStudentResults()
      .then((list) => list.map(_studentResultEntityMapper.toEntity))
      .handleNetworkError();
}
