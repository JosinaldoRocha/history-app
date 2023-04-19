import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HistoryState {}

class InitialHistoryState implements HistoryState {}

class LoadingHistoryState implements HistoryState {}

class SuccessHistoryState implements HistoryState {
  SuccessHistoryState({required this.data});
  final List<QueryDocumentSnapshot> data;
}

class FailureHistoryState implements HistoryState {
  FailureHistoryState({required this.errorMessage});
  final String errorMessage;
}
