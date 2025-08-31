import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:watch/common/helper/messages/display_message.dart';
import 'package:watch/common/helper/navigation/app_navigation.dart';
import 'package:watch/core/configs/routes/app_routes.dart';
import 'package:watch/core/configs/theme/app_colors.dart';
import 'package:watch/data/models/auth/signup_req_params.dart';
import 'package:watch/domain/auth/usecases/signup.dart';
import 'package:watch/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signupText(),
                const SizedBox(height: 30),

                _usernameTextField(),

                const SizedBox(height: 20),

                _emailTextField(),

                const SizedBox(height: 20),

                _passwordTextField(),

                const SizedBox(height: 60),

                _signupButton(context),

                const SizedBox(height: 10),

                _signinText(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      "Sign Up",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      controller: _nameCon,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(hintText: "Username"),
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

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      height: 50,
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUseCase>().call(
          params: SignupReqParams(
            usersName: _nameCon.text,
            usersEmail: _emailCon.text,
            usersPassword: _passwordCon.text,
          ),
        );
      },

      onSuccess: () {
        AppNavigation.pushNamedAndRemoveUntil(context, AppRoutes.homePage);
      },

      onFailure: (String error) async {
        DisplayMessage().errorMessage(error, context);
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Do you have an account? ",
            style: TextStyle(color: AppColors.grey),
          ),

          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.pushNamed(context, AppRoutes.signinPage);
              },
          ),
        ],
      ),
    );
  }
}
