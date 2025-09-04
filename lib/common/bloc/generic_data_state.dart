import 'package:equatable/equatable.dart';

abstract class GenericDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DataLoading extends GenericDataState {
  @override
  List<Object?> get props => [];
}

class DataLoaded<T> extends GenericDataState {
  final T data;

  DataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class DataFailureLoad extends GenericDataState {
  final String errorMessage;

  DataFailureLoad({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
