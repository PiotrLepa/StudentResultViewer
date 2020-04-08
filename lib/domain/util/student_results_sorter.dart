import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';

@lazySingleton
class StudentResultsSorter {
  // ignore: missing_return
  KtList<StudentResult> sort({
    @required KtList<StudentResult> items,
    @required StudentResultSortOption sortOption,
    @required StudentResultSortType sortType,
  }) {
    switch (sortOption) {
      case StudentResultSortOption.albumNumber:
        return _sortBy(
          items: items,
          sortType: sortType,
          selector: (item) => item.albumNumber,
        );
      case StudentResultSortOption.mark:
        return _sortBy(
          items: items,
          sortType: sortType,
          selector: (item) => item.mark,
        );
      case StudentResultSortOption.allPoints:
        return _sortBy(
          items: items,
          sortType: sortType,
          selector: (item) => item.allPoints,
        );
    }
  }

  KtList<StudentResult> _sortBy({
    @required KtList<StudentResult> items,
    @required StudentResultSortType sortType,
    @required Comparable Function(StudentResult) selector,
  }) {
    if (sortType == StudentResultSortType.ascending) {
      return items.sortedBy(selector);
    } else {
      return items.sortedByDescending(selector);
    }
  }
}
