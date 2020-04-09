part of 'student_result_details_bloc.dart';

@freezed
abstract class StudentResultDetailsEvent with _$StudentResultDetailsEvent {
  const factory StudentResultDetailsEvent.screenStarted(int albumNumber) =
      ScreenStarted;
}
