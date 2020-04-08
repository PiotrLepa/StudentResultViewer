import 'package:flutter/widgets.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_result_item.dart';

class StudentResultList extends StatelessWidget {
  final KtList<StudentResult> itemsData;

  const StudentResultList({
    Key key,
    this.itemsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsData.size,
      itemBuilder: (context, index) => StudentResultItem(
        data: itemsData[index],
      ),
    );
  }
}
