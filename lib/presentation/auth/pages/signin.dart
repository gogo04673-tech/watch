import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:watch/common/helper/messages/display_message.dart';
import 'package:watch/common/helper/navigation/app_navigation.dart';
import 'package:watch/core/configs/routes/app_routes.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/data/auth/models/signin_req_params.dart';
import 'package:watch/domain/auth/usecases/signin.dart';
import 'package:watch/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),

            const SizedBox(height: 30),

            _emailTextField(),

            const SizedBox(height: 20),

            _passwordTextField(),

            const SizedBox(height: 60),

            _signinButton(context),

            const SizedBox(height: 20),

            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _emailCon,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordCon,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      height: 50,
      activeColor: AppColors.primary,
      onPressed: () {
        return sl<SigninUseCase>().call(
          params: SigninReqParams(
            usersEmail: _emailCon.text,
            usersPassword: _passwordCon.text,
          ),
        );
      },

      onSuccess: () async {
        AppNavigation.pushNamedAndRemoveUntil(context, AppRoutes.homePage);
      },

      onFailure: (String error) async {
        DisplayMessage().errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't you have an account? ",
            style: TextStyle(color: AppColors.grey),
          ),

          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.pushReplacementNamed(
                  context,
                  AppRoutes.signupPage,
                );
              },
          ),
        ],
      ),
    );
  }
}
