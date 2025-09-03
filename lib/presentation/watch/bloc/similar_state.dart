import 'package:equatable/equatable.dart';
import 'package:watch/domain/movie/entities/movie.dart';

abstract class SimilarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SimilarLoading extends SimilarState {}

class SimilarLoaded extends SimilarState {
  final List<MovieEntity> similar;

  SimilarLoaded({required this.similar});

  @override
  List<Object?> get props => [similar];
}

class SimilarFailureLoad extends SimilarState {
  final String errorMessage;

  SimilarFailureLoad({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
