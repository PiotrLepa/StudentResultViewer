library student_result_model;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_result_model.freezed.dart';

part 'student_result_model.g.dart';

@freezed
abstract class StudentResultModel with _$StudentResultModel {
  const factory StudentResultModel({
    @required String index,
    @required double mark,
    @required String group,
    @required int lecturePoints,
    @required int homeworkPoints,
    @required int presenceCounter,
    @required int absenceCounter,
    @required int allPoints,
  }) = _StudentResultModel;

  factory StudentResultModel.fromJson(Map<String, dynamic> json) =>
      _$StudentResultModelFromJson(json);

  static const fromJsonFactory = _$StudentResultModelFromJson;
}
