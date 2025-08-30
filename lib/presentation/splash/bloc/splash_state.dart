import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class DisplaySplash extends SplashState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends SplashState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends SplashState {
  @override
  List<Object?> get props => [];
}
