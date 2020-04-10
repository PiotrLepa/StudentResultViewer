part of 'student_result_details_bloc.dart';

@freezed
abstract class StudentResultDetailsEvent with _$StudentResultDetailsEvent {
  const factory StudentResultDetailsEvent.fetchDetails(int albumNumber) =
      FetchDetails;
}
