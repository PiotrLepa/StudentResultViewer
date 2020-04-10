import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_points_and_presence.dart';

class StudentResultDetailsPage extends StatelessWidget {
  final StudentResult result;
  final StudentResultDetails resultDetails;

  const StudentResultDetailsPage({
    Key key,
    this.result,
    this.resultDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            result.albumNumber.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            result.group,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          StudentResultDetailsPointsAndPresence(
            result: result,
          ),
        ],
      ),
    );
  }
}
