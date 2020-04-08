part of 'student_result_bloc.dart';

@freezed
abstract class StudentResultEvent with _$StudentResultEvent {
  const factory StudentResultEvent.screenStarted() = ScreenStarted;

  const factory StudentResultEvent.sortResults({
    @required StudentResultSortOption sortOption,
    @required StudentResultSortType sortType,
  }) = SortResults;

  const factory StudentResultEvent.onSearchInputChanged(String query) =
      OnSearchInputChanged;

  const factory StudentResultEvent.onItemTapped(StudentResult entity) =
      OnItemTapped;
}
