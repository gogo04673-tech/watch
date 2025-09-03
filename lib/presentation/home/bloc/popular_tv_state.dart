import 'package:equatable/equatable.dart';
import 'package:watch/domain/tv/entities/tv.dart';

abstract class PopularTvState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularTvStateLoading extends PopularTvState {}

class PopularTvStateLoaded extends PopularTvState {
  final List<TvEntity> tv;

  PopularTvStateLoaded({required this.tv});

  @override
  List<Object> get props => [tv];
}

class PopularTvFailureLoad extends PopularTvState {
  final String errorMessage;

  PopularTvFailureLoad({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
