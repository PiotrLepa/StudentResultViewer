import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_item.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_row.dart';

class StudentResultDetailsPointsAndPresence extends StatelessWidget {
  final StudentResult result;

  const StudentResultDetailsPointsAndPresence({
    Key key,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StudentResultDetailsItem(
          header: context.translateKey('studentResultsHeaderAllPoints'),
          content: result.allPoints.toString(),
        ),
        SizedBox(height: 20),
        StudentResultDetailsRow(
          firstHeader: context.translateKey('studentResultsLecturePoints'),
          firstContent: result.lecturePoints.toString(),
          secondHeader: context.translateKey('studentResultsHomeworkPoints'),
          secondContent: result.homeworkPoints.toString(),
        ),
        Divider(
          height: 30,
          thickness: 1,
          color: Theme.of(context).primaryColorLight,
          indent: 20,
          endIndent: 20,
        ),
        StudentResultDetailsRow(
          firstHeader: context.translateKey('studentResultsPresenceCounter'),
          firstContent: result.presenceCounter.toString(),
          secondHeader: context.translateKey('studentResultsAbsenceCounter'),
          secondContent: result.absenceCounter.toString(),
        ),
      ],
    );
  }
}
