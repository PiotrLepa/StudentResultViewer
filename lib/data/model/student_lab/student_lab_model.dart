library student_lab_model;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_lab_model.freezed.dart';

part 'student_lab_model.g.dart';

@freezed
abstract class StudentLabModel with _$StudentLabModel {
  const factory StudentLabModel({
    @required String dateOfLab,
    @required bool presence,
    @required int points,
  }) = _StudentLabModel;

  factory StudentLabModel.fromJson(Map<String, dynamic> json) =>
      _$StudentLabModelFromJson(json);

  static const fromJsonFactory = _$StudentLabModelFromJson;
}
