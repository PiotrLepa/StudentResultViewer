import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/domain/bloc/student_result_details/student_result_details_bloc.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/presentation/common/loading_indicator.dart';
import 'package:student_result_viewer/presentation/student_result_details/widgets/student_result_details_page.dart';

class StudentResultDetailsScreen extends StatelessWidget {
  final StudentResult studentResult;

  const StudentResultDetailsScreen({
    Key key,
    @required this.studentResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentResultDetailsBloc>(
      create: (context) => getIt<StudentResultDetailsBloc>()
        ..add(
          StudentResultDetailsEvent.screenStarted(studentResult.albumNumber),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.translateKey('studentResultsDetailsAppBarTitle'),
          ),
        ),
        body: BlocBuilder<StudentResultDetailsBloc, StudentResultDetailsState>(
          condition: (oldState, newState) =>
              newState is Loading || newState is RenderStudentResultDetails,
          builder: (context, state) {
            return state.maybeMap(
              loading: (loading) {
                return Center(child: LoadingIndicator());
              },
              renderStudentResultDetails: (renderStudentResultDetails) {
                return StudentResultDetailsPage(
                  result: studentResult,
                  resultDetails: renderStudentResultDetails.details,
                );
              },
              // ignore: missing_return
              orElse: () {},
            );
          },
        ),
      ),
    );
  }
}
