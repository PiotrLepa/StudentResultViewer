import 'package:flutter/widgets.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/domain/entity/student_lab/student_lab.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/lab/student_result_details_lab_item.dart';

class StudentResultDetailsLabList extends StatelessWidget {
  final KtList<StudentLab> labs;

  const StudentResultDetailsLabList({
    Key key,
    @required this.labs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: labs.size,
      itemBuilder: (context, index) {
        final item = StudentResultDetailsLabItem(
          lab: labs[index],
        );
        final outPadding = 8.0;
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(left: outPadding),
            child: item,
          );
        } else if (index == labs.size - 1) {
          return Padding(
            padding: EdgeInsets.only(right: outPadding),
            child: item,
          );
        } else {
          return item;
        }
      },
    );
  }
}
