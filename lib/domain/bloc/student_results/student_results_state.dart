part of 'student_results_bloc.dart';

@freezed
abstract class StudentResultsState with _$StudentResultsState {
  const factory StudentResultsState.loading() = Loading;

  const factory StudentResultsState.renderStudentResults({
    @required KtList<StudentResult> items,
    @required StudentResultSortOption sortOption,
    @required StudentResultSortType sortType,
  }) = RenderStudentResults;

  const factory StudentResultsState.renderError(RawKeyString errorMessage) =
      RenderError;
}
