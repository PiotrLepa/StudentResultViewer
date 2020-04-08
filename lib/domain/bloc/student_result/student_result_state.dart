part of 'student_result_bloc.dart';

@freezed
abstract class StudentResultState with _$StudentResultState {
  const factory StudentResultState.loading() = Loading;

  const factory StudentResultState.renderStudentResults(
      KtList<StudentResult> items) = RenderStudentResults;

  const factory StudentResultState.renderError(RawKeyString errorMessage) =
      RenderError;
}
