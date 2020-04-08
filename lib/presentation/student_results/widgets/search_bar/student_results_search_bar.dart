import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_result_viewer/core/common/extension/build_context_extension.dart';
import 'package:student_result_viewer/domain/bloc/student_result/student_result_bloc.dart';

class StudentResultsSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) => _dispatchQueryChangedEvent(context, text),
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: context.translateKey('studentResultsSearchFieldLabel'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  void _dispatchQueryChangedEvent(BuildContext context, String query) {
    context
        .bloc<StudentResultBloc>()
        .add(StudentResultEvent.onSearchInputChanged(query));
  }
}
