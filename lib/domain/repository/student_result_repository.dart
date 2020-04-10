import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';

abstract class StudentResultRepository {
  Future<KtList<StudentResult>> getStudentResults();

  Future<StudentResultDetails> getStudentResultDetails(int albumNumber);
}
