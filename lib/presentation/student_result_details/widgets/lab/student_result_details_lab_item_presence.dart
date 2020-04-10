import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';

class StudentResultDetailsLabItemPresence extends StatelessWidget {
  final bool presence;

  const StudentResultDetailsLabItemPresence({
    Key key,
    @required this.presence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.translateKey(getTextKey()),
      style: TextStyle(
        color: getTextColor(),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  String getTextKey() =>
      presence ? 'studentResultsPresence' : 'studentResultsAbsence';

  Color getTextColor() => presence ? Colors.green : Colors.red;
}
