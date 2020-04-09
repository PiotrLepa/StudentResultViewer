import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/domain/bloc/student_results/student_results_bloc.dart';
import 'package:student_result_viewer/presentation/common/loading_indicator.dart';
import 'package:student_result_viewer/presentation/student_results/widgets/student_results_page.dart';

class StudentResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentResultsBloc>(
      create: (context) =>
          getIt<StudentResultsBloc>()..add(StudentResultsEvent.screenStarted()),
      child: Scaffold(
          appBar: AppBar(
            title: Text(context.translateKey('studentResultsAppBarTitle')),
          ),
          body: BlocBuilder<StudentResultsBloc, StudentResultsState>(
            condition: (oldState, newState) =>
                newState is Loading || newState is RenderStudentResults,
            builder: (context, state) {
              return state.maybeMap(
                loading: (loading) {
                  return Center(child: LoadingIndicator());
                },
                renderStudentResults: (renderStudentResults) {
                  return StudentResultPage(
                    itemsData: renderStudentResults.items,
                    sortOption: renderStudentResults.sortOption,
                    sortType: renderStudentResults.sortType,
                  );
                },
                // ignore: missing_return
                orElse: () {},
              );
            },
          )),
    );
  }
}
