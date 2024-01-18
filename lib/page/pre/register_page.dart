import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/register_requirements.dart';
import 'package:login_ui/components/reset_and_sign_up.dart';
import 'package:login_ui/components/terms_of_service_text.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/page/pre/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              'assets/img/purplebg.jpeg',
              height: screenHeight,
              width: screenWidth,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: Center(
                  child: SizedBox(
                    height: screenWidth * 0.1,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText('Join the Community',
                            duration: const Duration(seconds: 5),
                            textStyle: const TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'Times New Roman',
                                fontStyle: FontStyle.italic))
                      ],
                      repeatForever: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(color: Colors.transparent.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                child: RegisterPageForms(
                    email: email,
                    password: password,
                    confirmPassword: confirmPassword,
                    onPressed: () => authService.signUserUp(context, email, password, confirmPassword)),
              ),
              const SizedBox(height: 10),
              const ResetAndSignUp(
                  check: 'Already have an account? ',
                  clickable: 'Login here!',
                  page: LoginPage(),
                  mainAlign: MainAxisAlignment.center),
              const SizedBox(height: 70),
              const TermOfServiceText(
                check: 'By signing up, you agree to our',
                clickable: 'Terms of Service and Privacy Policy',
                page: LoginPage(),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
