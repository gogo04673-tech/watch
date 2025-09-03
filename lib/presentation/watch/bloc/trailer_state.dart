import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TrailerStateLoading extends TrailerState {}

class TrailerStateLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  TrailerStateLoaded({required this.youtubePlayerController});

  @override
  List<Object?> get props => [youtubePlayerController];
}

class TrailerStateFailureLoad extends TrailerState {
  final String errorMessage;

  TrailerStateFailureLoad({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
