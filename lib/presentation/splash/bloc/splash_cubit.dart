import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/domain/auth/usecases/is_logger.dart';
import 'package:watch/presentation/splash/bloc/splash_state.dart';
import 'package:watch/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggerIn = await sl<IsLoggedUseCase>().call();

    if (isLoggerIn == true) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
