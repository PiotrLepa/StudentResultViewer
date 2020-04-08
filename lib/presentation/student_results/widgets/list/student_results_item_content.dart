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
      firstItem: _buildText(data.albumNumber.toString()),
      secondItem: _buildText(data.mark.toString()),
      thirdItem: _buildText(data.allPoints.toString()),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    );
  }
}
