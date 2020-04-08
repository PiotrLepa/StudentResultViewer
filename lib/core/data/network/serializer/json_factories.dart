import 'package:student_result_viewer/data/model/student_result/student_result_model.dart';

const Map<Type, Object Function(Map<String, dynamic> json)> jsonFactories = {
  StudentResultModel: StudentResultModel.fromJsonFactory,
};
