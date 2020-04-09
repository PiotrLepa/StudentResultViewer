part of 'student_results_bloc.dart';

@freezed
abstract class StudentResultsEvent with _$StudentResultsEvent {
  const factory StudentResultsEvent.screenStarted() = ScreenStarted;

  const factory StudentResultsEvent.sortResults({
    @required StudentResultSortOption sortOption,
    @required StudentResultSortType sortType,
  }) = SortResults;

  const factory StudentResultsEvent.onSearchInputChanged(String query) =
      OnSearchInputChanged;

  const factory StudentResultsEvent.onItemTapped(StudentResult entity) =
      OnItemTapped;
}
