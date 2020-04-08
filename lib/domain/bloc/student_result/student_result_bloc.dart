import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/domain/bloc/bloc_helper.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/domain/repository/student_result_repository.dart';
import 'package:student_result_viewer/domain/util/student_results_sorter.dart';

part 'student_result_bloc.freezed.dart';

part 'student_result_event.dart';

part 'student_result_state.dart';

@injectable
class StudentResultBloc extends Bloc<StudentResultEvent, StudentResultState> {
  final StudentResultRepository _studentResultRepository;
  final StudentResultsSorter _studentResultsSorter;

  KtList<StudentResult> _fetchedStudentResults;

  StudentResultBloc(
    this._studentResultRepository,
    this._studentResultsSorter,
  );

  @override
  StudentResultState get initialState => StudentResultState.loading();

  @override
  Stream<StudentResultState> mapEventToState(
    StudentResultEvent event,
  ) async* {
    yield* event.map(
      screenStarted: _mapScreenStartedEvent,
      sortResults: _mapSortResultsEvent,
      onSearchInputChanged: (_) {}, // TODO
      onItemTapped: (_) {},
    );
  }

  Stream<StudentResultState> _mapScreenStartedEvent(
    ScreenStarted event,
  ) async* {
    yield* _fetchStudentResults();
  }

  Stream<StudentResultState> _mapSortResultsEvent(
    SortResults event,
  ) async* {
    yield StudentResultState.renderStudentResults(
      items: _studentResultsSorter.sort(
        items: _fetchedStudentResults,
        sortOption: event.sortOption,
        sortType: event.sortType,
      ),
      sortOption: event.sortOption,
      sortType: event.sortType,
    );
  }

  Stream<StudentResultState> _fetchStudentResults() async* {
    final request = fetch(_studentResultRepository.getStudentResults());
    await for (final state in request) {
      yield* state.when(
        progress: () async* {
          yield StudentResultState.loading();
        },
        success: (response) async* {
          _fetchedStudentResults = response;
          final defaultSortOption = StudentResultSortOption.albumNumber;
          final defaultSortType = StudentResultSortType.ascending;
          final items = _studentResultsSorter.sort(
            items: response,
            sortOption: defaultSortOption,
            sortType: defaultSortType,
          );
          yield StudentResultState.renderStudentResults(
            items: items,
            sortOption: defaultSortOption,
            sortType: defaultSortType,
          );
        },
        error: (errorMessage) async* {
          yield StudentResultState.renderError(errorMessage);
        },
      );
    }
  }
}
