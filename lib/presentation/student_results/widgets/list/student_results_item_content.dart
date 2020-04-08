import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_result_items_container.dart';

class StudentResultItemContent extends StatelessWidget {
  final StudentResult data;

  const StudentResultItemContent({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StudentResultItemsContainer(
      firstItem: _buildText(context, data.albumNumber.toString()),
      secondItem: _buildText(context, data.mark.toString()),
      thirdItem: _buildText(context, data.allPoints.toString()),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
