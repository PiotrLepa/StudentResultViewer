library student_result;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_result.freezed.dart';

@freezed
abstract class StudentResult with _$StudentResult {
  const factory StudentResult({
    @required String index,
    @required double mark,
    @required String group,
    @required int lecturePoints,
    @required int homeworkPoints,
    @required int presenceCounter,
    @required int absenceCounter,
    @required int allPoints,
  }) = _StudentResult;
}
