import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/data/mapper/entity_mapper.dart';
import 'package:student_result_viewer/data/model/student_lab/student_lab_model.dart';
import 'package:student_result_viewer/domain/entity/student_lab/student_lab.dart';

@RegisterAs(EntityMapper)
@lazySingleton
class StudentLabEntityMapper
    implements EntityMapper<StudentLab, StudentLabModel> {
  @override
  StudentLab toEntity(StudentLabModel model) => StudentLab(
        dateOfLab: model.dateOfLab,
        presence: model.presence,
        points: model.points,
      );
}
