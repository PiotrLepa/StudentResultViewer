import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/lab/student_result_details_lab_list.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/points/student_result_details_points_and_presence.dart';

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
          SizedBox(height: 40),
          Text(
            context.translateKey('studentResultsDetailsLabsHeader'),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: StudentResultDetailsLabList(
              labs: resultDetails.labs,
            ),
          )
        ],
      ),
    );
  }
}
