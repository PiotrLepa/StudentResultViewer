import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:student_result_viewer/core/common/raw_key_string.dart';
import 'package:student_result_viewer/core/common/router/router.gr.dart';
import 'package:student_result_viewer/core/domain/bloc/bloc_helper.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_option.dart';
import 'package:student_result_viewer/domain/entity/student_result/student_result_sort_type.dart';
import 'package:student_result_viewer/domain/repository/student_result_repository.dart';
import 'package:student_result_viewer/domain/util/student_results_sorter.dart';

part 'student_results_bloc.freezed.dart';

part 'student_results_event.dart';

part 'student_results_state.dart';

@injectable
class StudentResultsBloc
    extends Bloc<StudentResultsEvent, StudentResultsState> {
  final StudentResultRepository _studentResultRepository;
  final StudentResultsSorter _studentResultsSorter;

  KtList<StudentResult> _fetchedStudentResults;
  KtList<StudentResult> _filteredStudentResults;

  StudentResultsBloc(
    this._studentResultRepository,
    this._studentResultsSorter,
  );

  @override
  StudentResultsState get initialState => StudentResultsState.loading();

  @override
  Stream<StudentResultsState> transformEvents(
    Stream<StudentResultsEvent> events,
    Stream<StudentResultsState> Function(StudentResultsEvent) next,
  ) {
    return super.transformEvents(
        events.debounce((event) => event is OnSearchInputChanged
            ? TimerStream(true, Duration(milliseconds: 350))
            : TimerStream(true, Duration())),
        next);
  }

  @override
  Stream<StudentResultsState> mapEventToState(
    StudentResultsEvent event,
  ) async* {
    yield* event.map(
      screenStarted: _mapScreenStartedEvent,
      sortResults: _mapSortResultsEvent,
      onSearchInputChanged: _mapOnSearchInputChangedEvent,
      onItemTapped: _mapOnItemTappedEvent,
    );
  }

  Stream<StudentResultsState> _mapScreenStartedEvent(
    ScreenStarted event,
  ) async* {
    yield* _fetchStudentResults();
  }

  Stream<StudentResultsState> _mapSortResultsEvent(
    SortResults event,
  ) async* {
    yield StudentResultsState.renderStudentResults(
      items: _studentResultsSorter.sort(
        items: _filteredStudentResults,
        sortOption: event.sortOption,
        sortType: event.sortType,
      ),
      sortOption: event.sortOption,
      sortType: event.sortType,
    );
  }

  Stream<StudentResultsState> _mapOnItemTappedEvent(
    OnItemTapped onItemTapped,
  ) async* {
    ExtendedNavigator.ofRouter<Router>().pushStudentResultDetailsScreen(
      studentResult: onItemTapped.entity,
    );
  }

  Stream<StudentResultsState> _mapOnSearchInputChangedEvent(
    OnSearchInputChanged onItemTapped,
  ) async* {
    _filteredStudentResults = _fetchedStudentResults.filter(
        (item) => item.albumNumber.toString().contains(onItemTapped.query));
    yield (state as RenderStudentResults).copyWith(
      items: _filteredStudentResults,
    );
  }

  Stream<StudentResultsState> _fetchStudentResults() async* {
    final request = fetch(_studentResultRepository.getStudentResults());
    await for (final state in request) {
      yield* state.when(
        progress: () async* {
          yield StudentResultsState.loading();
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
          yield StudentResultsState.renderStudentResults(
            items: items,
            sortOption: defaultSortOption,
            sortType: defaultSortType,
          );
        },
        error: (errorMessage) async* {
          yield StudentResultsState.renderError(errorMessage);
        },
      );
    }
  }
}
