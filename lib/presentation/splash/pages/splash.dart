import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch/common/helper/navigation/app_navigation.dart';
import 'package:watch/core/configs/assets/app_images.dart';
import 'package:watch/core/configs/routes/app_routes.dart';
import 'package:watch/presentation/splash/bloc/splash_cubit.dart';
import 'package:watch/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Authenticated) {
            AppNavigation.pushReplacementNamed(context, AppRoutes.homePage);
          }

          if (state is UnAuthenticated) {
            AppNavigation.pushReplacementNamed(context, AppRoutes.signinPage);
          }
        },
        child: Stack(
          children: [
            // * ============> Background splash is image <============ * //
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff1A1B20),
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // * ============> gradient bottom is here <============ * //
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // ignore: deprecated_member_use
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
