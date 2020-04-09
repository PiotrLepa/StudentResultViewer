import 'package:student_result_viewer/data/model/student_lab/student_lab_model.dart';
import 'package:student_result_viewer/data/model/student_result/student_result_model.dart';
import 'package:student_result_viewer/data/model/student_result_details/student_result_details_model.dart';

const Map<Type, Object Function(Map<String, dynamic> json)> jsonFactories = {
  StudentResultModel: StudentResultModel.fromJsonFactory,
  StudentLabModel: StudentLabModel.fromJsonFactory,
  StudentResultDetailsModel: StudentResultDetailsModel.fromJsonFactory,
};
