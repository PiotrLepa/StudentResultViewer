part of 'student_result_details_bloc.dart';

@freezed
abstract class StudentResultDetailsState with _$StudentResultDetailsState {
  const factory StudentResultDetailsState.loading() = Loading;

  const factory StudentResultDetailsState.renderStudentResultDetails(
    StudentResultDetails details,
  ) = RenderStudentResultDetails;

  const factory StudentResultDetailsState.renderError(
      RawKeyString errorMessage) = RenderError;
}
