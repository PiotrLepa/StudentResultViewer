import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/common/extension/iterable_extension.dart';
import 'package:student_result_viewer/core/data/mapper/entity_mapper.dart';
import 'package:student_result_viewer/data/model/student_lab/student_lab_model.dart';
import 'package:student_result_viewer/data/model/student_result_details/student_result_details_model.dart';
import 'package:student_result_viewer/domain/entity/student_lab/student_lab.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';

@RegisterAs(EntityMapper)
@lazySingleton
class StudentResultDetailsEntityMapper
    implements EntityMapper<StudentResultDetails, StudentResultDetailsModel> {
  final EntityMapper<StudentLab, StudentLabModel> _studentLabEntityMapper;

  StudentResultDetailsEntityMapper(this._studentLabEntityMapper);

  @override
  StudentResultDetails toEntity(StudentResultDetailsModel model) =>
      StudentResultDetails(
        albumNumber: int.parse(model.index),
        group: model.group,
        labs: model.labs.map(_studentLabEntityMapper.toEntity).toKtList(),
      );
}
