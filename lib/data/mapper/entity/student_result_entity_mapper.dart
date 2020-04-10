import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/data/mapper/entity_mapper.dart';
import 'package:student_result_viewer/data/model/student_result/student_result_model.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';

@RegisterAs(EntityMapper)
@lazySingleton
class StudentResultEntityMapper
    implements EntityMapper<StudentResult, StudentResultModel> {
  @override
  StudentResult toEntity(StudentResultModel model) => StudentResult(
      albumNumber: int.parse(model.index),
      mark: model.mark,
      group: model.group,
      lecturePoints: model.lecturePoints,
      homeworkPoints: model.homeworkPoints,
      presenceCounter: model.presenceCounter,
      absenceCounter: model.absenceCounter,
      allPoints: model.allPoints);
}
