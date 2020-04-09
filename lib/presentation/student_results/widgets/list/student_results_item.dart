import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/domain/bloc/student_result/student_result_bloc.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/list/student_results_item_content.dart';

class StudentResultItem extends StatelessWidget {
  final StudentResult data;

  const StudentResultItem({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = const BorderRadius.all(Radius.circular(16));
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: borderRadius,
            boxShadow: _boxItemShadow(context),
          ),
          child: InkWell(
            onTap: () => _dispatchItemTappedEvent(context),
            borderRadius: borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: StudentResultItemContent(
                data: data,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow> _boxItemShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).primaryColorLight,
        offset: Offset(0, 2),
        blurRadius: 1,
      ),
    ];
  }

  void _dispatchItemTappedEvent(BuildContext context) {
    context
        .bloc<StudentResultBloc>()
        .add(StudentResultEvent.onItemTapped(data));
  }
}
