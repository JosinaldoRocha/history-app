abstract class PeriodListState {}

class InitialPeriodListState implements PeriodListState {}

class LoadingPeriodListState implements PeriodListState {}

class SuccessPeriodListState implements PeriodListState {
  SuccessPeriodListState({required this.data});
  final List<String> data;
}

class FailurePeriodListState implements PeriodListState {
  FailurePeriodListState({required this.errorMessage});
  final String errorMessage;
}
