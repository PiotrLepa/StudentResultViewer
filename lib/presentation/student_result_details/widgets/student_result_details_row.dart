import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_item.dart';

class StudentResultDetailsRow extends StatelessWidget {
  final String firstHeader;
  final String firstContent;
  final String secondHeader;
  final String secondContent;

  const StudentResultDetailsRow({
    Key key,
    @required this.firstHeader,
    @required this.firstContent,
    @required this.secondHeader,
    @required this.secondContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: StudentResultDetailsItem(
            header: firstHeader,
            content: firstContent,
          ),
        ),
        Expanded(
          child: StudentResultDetailsItem(
            header: secondHeader,
            content: secondContent,
          ),
        ),
      ],
    );
  }
}
