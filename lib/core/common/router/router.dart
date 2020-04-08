import 'package:auto_route/auto_route_annotations.dart';
import 'package:student_result_viewer/presentation/student_results/student_results_screen.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  StudentResultScreen studentResultScreen;
}
