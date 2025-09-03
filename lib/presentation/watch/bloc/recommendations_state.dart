import 'package:equatable/equatable.dart';
import 'package:watch/domain/movie/entities/movie.dart';

abstract class RecommendationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecommendationsLoading extends RecommendationsState {}

class RecommendationsLoaded extends RecommendationsState {
  final List<MovieEntity> recommendations;

  RecommendationsLoaded({required this.recommendations});

  @override
  List<Object?> get props => [recommendations];
}

class RecommendationsFailureLoad extends RecommendationsState {
  final String errorMessage;

  RecommendationsFailureLoad({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
