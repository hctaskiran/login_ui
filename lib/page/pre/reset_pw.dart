// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/reset_and_sign_up.dart';
import 'package:login_ui/components/reset_requirements.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/page/pre/login_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();

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
                            FadeAnimatedText('Recover Your Moments',
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
                    child: ResetPageForm(
                      email: email,
                      onPressed: () => authService.resetPassword(email.text.trim(), context),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const ResetAndSignUp(
                    check: 'Changed your mind? ',
                    clickable: 'Login back!',
                    page: LoginPage(),
                    mainAlign: MainAxisAlignment.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
