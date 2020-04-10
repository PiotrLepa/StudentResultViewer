library student_result_details_model;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_result_viewer/data/model/student_lab/student_lab_model.dart';

part 'student_result_details_model.freezed.dart';

part 'student_result_details_model.g.dart';

@freezed
abstract class StudentResultDetailsModel with _$StudentResultDetailsModel {
  const factory StudentResultDetailsModel({
    @required String index,
    @required String group,
    @required List<StudentLabModel> labs,
  }) = _StudentResultDetailsModel;

  factory StudentResultDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$StudentResultDetailsModelFromJson(json);

  static const fromJsonFactory = _$StudentResultDetailsModelFromJson;
}
