import 'package:auto_route/auto_route_annotations.dart';
import 'package:student_result_viewer/presentation/student_result_details/student_result_details_screen.dart';
import 'package:student_result_viewer/presentation/student_results/student_results_screen.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  StudentResultScreen studentResultScreen;
  StudentResultDetailsScreen studentResultDetailsScreen;
}
