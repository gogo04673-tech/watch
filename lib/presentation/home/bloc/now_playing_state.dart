import 'package:equatable/equatable.dart';
import 'package:watch/domain/movie/entities/movie.dart';

abstract class NowPlayingState extends Equatable {
  @override
  List<Object> get props => [];
}

class NowPlayingStateLoading extends NowPlayingState {}

class NowPlayingStateLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingStateLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class NowPlayingStateFailureLoad extends NowPlayingState {
  final String errorMessage;

  NowPlayingStateFailureLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
