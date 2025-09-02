import 'package:equatable/equatable.dart';
import 'package:watch/domain/movie/entities/movie.dart';

abstract class TrendingState extends Equatable {
  @override
  List<Object> get props => [];
}

class TrendingStateLoading extends TrendingState {}

class TrendingStateLoaded extends TrendingState {
  final List<MovieEntity> movies;

  TrendingStateLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class TrendingStateFailureLoad extends TrendingState {
  final String errorMessage;

  TrendingStateFailureLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
