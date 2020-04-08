import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/domain/bloc/student_result/student_result_bloc.dart';
import 'package:student_result_viewer/presentation/common/loading_indicator.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_result_list.dart';

class StudentResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentResultBloc>(
      create: (context) =>
          getIt<StudentResultBloc>()..add(StudentResultEvent.screenStarted()),
      child: Scaffold(
          body: BlocBuilder<StudentResultBloc, StudentResultState>(
        condition: (oldState, newState) =>
            newState is Loading || newState is RenderStudentResults,
        builder: (context, state) {
          return state.maybeMap(
            loading: (loading) => Center(child: LoadingIndicator()),
            renderStudentResults: (renderStudentResults) => StudentResultList(
              itemsData: renderStudentResults.items,
            ),
            // ignore: missing_return
            orElse: () {},
          );
        },
      )),
    );
  }
}
