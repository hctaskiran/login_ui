// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/divider.dart';
import 'package:login_ui/components/login_requirements.dart';
import 'package:login_ui/components/reset_and_sign_up.dart';
import 'package:login_ui/page/auth/auth_service.dart';
import 'package:login_ui/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.2),
                    child: Center(
                      child: SizedBox(
                        height: screenWidth * 0.1,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText('Welcome',
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
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                    child: LoginPageForms(
                      email: email,
                      password: password,
                      onPressed: () => signUserIn(context, email, password),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const ResetAndSignUp(
                    check: 'Forgot passoword?',
                    clickable: 'Reset now!',
                    page: RegisterPage(),
                    mainAlign: MainAxisAlignment.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  LoginDivider(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.03),
                  const ResetAndSignUp(
                    check: 'Don\'t have an account?',
                    clickable: 'Sign up!',
                    page: RegisterPage(),
                    mainAlign: MainAxisAlignment.center,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
