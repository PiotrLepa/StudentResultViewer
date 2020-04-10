import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/domain/bloc/bloc_helper.dart';
import 'package:student_result_viewer/domain/entity/student_result_details/student_result_details.dart';
import 'package:student_result_viewer/domain/repository/student_result_repository.dart';

part 'student_result_details_bloc.freezed.dart';
part 'student_result_details_event.dart';
part 'student_result_details_state.dart';

@injectable
class StudentResultDetailsBloc
    extends Bloc<StudentResultDetailsEvent, StudentResultDetailsState> {
  final StudentResultRepository _studentResultRepository;

  StudentResultDetailsBloc(
    this._studentResultRepository,
  );

  @override
  StudentResultDetailsState get initialState =>
      StudentResultDetailsState.loading();

  @override
  Stream<StudentResultDetailsState> mapEventToState(
    StudentResultDetailsEvent event,
  ) async* {
    if (event is FetchDetails) {
      yield* _fetchStudentResultDetails(event.albumNumber);
    }
  }

  Stream<StudentResultDetailsState> _fetchStudentResultDetails(
      int albumNumber) async* {
    final request =
        fetch(_studentResultRepository.getStudentResultDetails(albumNumber));
    await for (final state in request) {
      yield* state.when(
        progress: () async* {
          yield StudentResultDetailsState.loading();
        },
        success: (response) async* {
          yield StudentResultDetailsState.renderStudentResultDetails(response);
        },
        error: (errorMessage) async* {
          yield StudentResultDetailsState.renderError(errorMessage);
        },
      );
    }
  }
}
