import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/domain/entity/student_lab/student_lab.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/lab/student_result_details_lab_item_presence.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_item.dart';

class StudentResultDetailsLabItem extends StatelessWidget {
  final StudentLab lab;

  const StudentResultDetailsLabItem({
    Key key,
    @required this.lab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              lab.dateOfLab,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            StudentResultDetailsLabItemPresence(
              presence: lab.presence,
            ),
            StudentResultDetailsItem(
              header: context.translateKey('studentResultsDetailsLabPoints'),
              content: lab.points.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
