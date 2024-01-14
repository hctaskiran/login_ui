import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';
import 'package:login_ui/components/login_form.dart';
import 'package:login_ui/components/reset_and_sign_up.dart';
import 'package:login_ui/page/home_page.dart';
import 'package:login_ui/page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text('Login to see what others have done!',
                            style: TextStyle(color: Colors.white.withOpacity(0.6))),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            LoginForm(
                              controller: email,
                              hint: 'Enter an Email',
                              label: 'Email',
                              icon: Icons.email,
                              action: TextInputAction.next,
                            ),
                            const SizedBox(height: 15),
                            LoginForm(
                                controller: password,
                                hint: 'Enter a Password',
                                label: 'Password',
                                icon: Icons.key,
                                action: TextInputAction.done),
                          ],
                        ),
                        const ResetAndSignUp(
                          check: '',
                          clickable: 'Reset Password',
                          page: RegisterPage(),
                          mainAlign: MainAxisAlignment.end,
                        ),
                        const SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.4),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: TextButton(
                                  isSemanticButton: false,
                                  onPressed: () {
                                    Navigator.pushReplacement(context, FadeAnim(page: const HomeView()));
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                  )),
                            )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
