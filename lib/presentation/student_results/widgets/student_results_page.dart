import 'package:flutter/widgets.dart';
import 'package:kt_dart/kt.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_headers.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/list/student_results_list.dart';

class StudentResultPage extends StatelessWidget {
  final KtList<StudentResult> itemsData;
  final StudentResultSortOption sortOption;
  final StudentResultSortType sortType;

  const StudentResultPage({
    Key key,
    @required this.itemsData,
    @required this.sortOption,
    @required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: StudentResultsHeaders(
            sortOption: sortOption,
            sortType: sortType,
          ),
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
