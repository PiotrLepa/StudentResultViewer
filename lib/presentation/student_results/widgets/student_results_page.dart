import 'package:flutter/widgets.dart';
import 'package:kt_dart/kt.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_headers.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/list/student_results_list.dart';

class StudentResultPage extends StatelessWidget {
  final KtList<StudentResult> itemsData;

  const StudentResultPage({
    Key key,
    this.itemsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StudentResultsHeaders(),
        ),
        Expanded(
          child: StudentResultList(
            itemsData: itemsData,
          ),
        ),
      ],
    );
  }
}
