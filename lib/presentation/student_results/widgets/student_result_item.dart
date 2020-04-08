import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';

class StudentResultItem extends StatelessWidget {
  final StudentResult data;

  const StudentResultItem({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data.toString());
  }
}
