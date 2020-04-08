import 'package:flutter/widgets.dart';
import 'package:kt_dart/kt.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_headers.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/list/student_results_list.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/search_bar/student_results_search_bar.dart';

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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          StudentResultsSearchBar(),
          _buildSeparator(),
          StudentResultsHeaders(
            sortOption: sortOption,
            sortType: sortType,
          ),
          _buildSeparator(),
          Expanded(
            child: StudentResultList(
              itemsData: itemsData,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return SizedBox(height: 12);
  }
}
