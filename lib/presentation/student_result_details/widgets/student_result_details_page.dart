import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';

class StudentResultDetailsPage extends StatelessWidget {
  final StudentResultDetails data;

  const StudentResultDetailsPage({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(data.toString()));
  }
}
