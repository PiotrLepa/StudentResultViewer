import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/header/student_results_header_item.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_result_items_container.dart';

class StudentResultsHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StudentResultItemsContainer(
      firstItem: _buildHeader('Nr albumu'),
      secondItem: _buildHeader('Ocena'),
      thirdItem: _buildHeader('Punkty'),
    );
  }

  Widget _buildHeader(String headerText) {
    return StudentResultsHeaderItem(
      headerText: headerText,
    );
  }
}
