import 'package:equatable/equatable.dart';
import 'package:watch/domain/movie/entities/movie.dart';
import 'package:watch/domain/tv/entities/tv.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movies;

  MovieLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class TvLoaded extends SearchState {
  final List<TvEntity> tvs;

  TvLoaded({required this.tvs});

  @override
  List<Object?> get props => [tvs];
}

class SearchFailureLoad extends SearchState {
  final String errorMessage;

  SearchFailureLoad({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
