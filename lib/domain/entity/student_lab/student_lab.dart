library student_lab;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_lab.freezed.dart';

@freezed
abstract class StudentLab with _$StudentLab {
  const factory StudentLab({
    @required String dateOfLab,
    @required bool presence,
    @required int points,
  }) = _StudentLab;
}
