library student_result_details;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/domain/entity/student_lab/student_lab.dart';

part 'student_result_details.freezed.dart';

@freezed
abstract class StudentResultDetails with _$StudentResultDetails {
  const factory StudentResultDetails({
    @required int albumNumber,
    @required String group,
    @required KtList<StudentLab> labs,
  }) = _StudentResultDetails;
}
