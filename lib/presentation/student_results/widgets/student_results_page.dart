import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kt_dart/kt.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_headers.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/list/student_results_item.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/search_bar/student_results_search_bar.dart';

class StudentResultPage extends StatelessWidget {
  final KtList<StudentResult> itemsData;
  final StudentResultSortOption sortOption;
  final StudentResultSortType sortType;

  static const _separatorHeight = 12.0;

  const StudentResultPage({
    Key key,
    @required this.itemsData,
    @required this.sortOption,
    @required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _separatorHeight),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: _separatorHeight),
              child: StudentResultsSearchBar(),
            ),
            expandedHeight: 70,
            floating: true,
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(16),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _buildSeparator(),
                  StudentResultsHeaders(
                    sortOption: sortOption,
                    sortType: sortType,
                  ),
                  _buildSeparator(),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => StudentResultItem(
                data: itemsData[index],
              ),
              childCount: itemsData.size,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return const SizedBox(height: _separatorHeight);
  }
}
