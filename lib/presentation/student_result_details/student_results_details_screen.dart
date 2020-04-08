import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/domain/bloc/student_result/student_result_bloc.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';

class StudentResultDetailsScreen extends StatelessWidget {
  final StudentResult studentResult;

  const StudentResultDetailsScreen({
    Key key,
    @required this.studentResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentResultBloc>(
        create: (context) =>
            getIt<StudentResultBloc>()..add(StudentResultEvent.screenStarted()),
        child: Scaffold(
          appBar: AppBar(
            title:
                Text(context.translateKey('studentResultsDetailsAppBarTitle')),
          ),
          body: Text("details"),
        ));
  }
}
