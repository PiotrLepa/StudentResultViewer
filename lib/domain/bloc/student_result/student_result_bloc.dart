import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/domain/bloc/bloc_helper.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/repository/student_result_repository.dart';

part 'student_result_bloc.freezed.dart';

part 'student_result_event.dart';

part 'student_result_state.dart';

@injectable
class StudentResultBloc extends Bloc<StudentResultEvent, StudentResultState> {
  final StudentResultRepository _studentResultRepository;

  StudentResultBloc(this._studentResultRepository);

  @override
  StudentResultState get initialState => StudentResultState.loading();

  @override
  Stream<StudentResultState> mapEventToState(
    StudentResultEvent event,
  ) async* {
    yield* event.map(
      screenStarted: _mapScreenStartedEvent,
      onSearchInputChanged: (_) {}, // TODO
      onItemTapped: (_) {},
    );
  }

  Stream<StudentResultState> _mapScreenStartedEvent(
    ScreenStarted event,
  ) async* {
    yield* fetchStudentResults();
  }

  Stream<StudentResultState> fetchStudentResults() async* {
    final request = fetch(_studentResultRepository.getStudentResults());
    await for (final state in request) {
      yield* state.when(
        progress: () async* {
          yield StudentResultState.loading();
        },
        success: (response) async* {
          yield StudentResultState.renderStudentResults(response);
        },
        error: (errorMessage) async* {
          yield StudentResultState.renderError(errorMessage);
        },
      );
    }
  }
}
