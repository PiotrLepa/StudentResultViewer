part of 'student_result_bloc.dart';

@freezed
abstract class StudentResultState with _$StudentResultState {
  const factory StudentResultState.loading() = Loading;

  const factory StudentResultState.renderStudentResults({
    @required KtList<StudentResult> items,
    @required StudentResultSortOption sortOption,
    @required StudentResultSortType sortType,
  }) = RenderStudentResults;

  const factory StudentResultState.renderError(RawKeyString errorMessage) =
      RenderError;
}
