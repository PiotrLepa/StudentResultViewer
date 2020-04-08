import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/domain/bloc/student_result/student_result_bloc.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_header_item.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_result_items_container.dart';

class StudentResultsHeaders extends StatelessWidget {
  final StudentResultSortOption sortOption;
  final StudentResultSortType sortType;

  const StudentResultsHeaders({
    Key key,
    @required this.sortOption,
    @required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StudentResultItemsContainer(
      firstItem: StudentResultsHeaderItem(
        headerText: context.translateKey('studentResultsHeaderAlbumNumber'),
        sortType: _getSortTypeForHeader(StudentResultSortOption.albumNumber),
        onTap: () {
          _dispatchSortItemsEvent(context, StudentResultSortOption.albumNumber);
        },
      ),
      secondItem: StudentResultsHeaderItem(
        headerText: context.translateKey('studentResultsHeaderMark'),
        sortType: _getSortTypeForHeader(StudentResultSortOption.mark),
        onTap: () {
          _dispatchSortItemsEvent(context, StudentResultSortOption.mark);
        },
      ),
      thirdItem: StudentResultsHeaderItem(
        headerText: context.translateKey('studentResultsHeaderAllPoints'),
        sortType: _getSortTypeForHeader(StudentResultSortOption.allPoints),
        onTap: () {
          _dispatchSortItemsEvent(context, StudentResultSortOption.allPoints);
        },
      ),
    );
  }

  StudentResultSortType _getSortTypeForHeader(StudentResultSortOption target) =>
      sortOption == target ? sortType : StudentResultSortType.unsorted;

  void _dispatchSortItemsEvent(
    BuildContext context,
    StudentResultSortOption sortOption,
  ) {
    context.bloc<StudentResultBloc>().add(StudentResultEvent.sortResults(
          sortOption: sortOption,
          sortType: _getNextSortType(),
        ));
  }

  // ignore: missing_return
  StudentResultSortType _getNextSortType() {
    switch (sortType) {
      case StudentResultSortType.ascending:
        return StudentResultSortType.descending;
      case StudentResultSortType.descending:
        return StudentResultSortType.ascending;
      case StudentResultSortType.unsorted:
        return StudentResultSortType.ascending;
    }
  }
}
