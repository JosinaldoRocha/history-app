abstract class RelationshipListState {}

class InitialRelationshipListState implements RelationshipListState {}

class LoadingRelationshipListState implements RelationshipListState {}

class SuccessRelationshipListState implements RelationshipListState {
  SuccessRelationshipListState({required this.data});
  final List<String> data;
}

class FailureRelationshipListState implements RelationshipListState {
  FailureRelationshipListState({required this.errorMessage});
  final String errorMessage;
}
