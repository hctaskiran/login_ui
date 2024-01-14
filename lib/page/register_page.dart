import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';
import 'package:login_ui/components/register_form.dart';
import 'package:login_ui/page/home_page.dart';
import 'package:login_ui/page/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void register() {
      if (formKey.currentState!.validate()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
      } else {
        return;
      }
    }

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
            Column(
              children: [
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
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text('Register and share your moments!',
                            style: TextStyle(color: Colors.white.withOpacity(0.6))),
                        const SizedBox(height: 20),
                        RegisterForm(
                            controller: email,
                            hint: 'Enter an Email',
                            label: 'Email',
                            icon: Icons.email,
                            action: TextInputAction.next),
                        RegisterForm(
                            controller: password,
                            hint: 'Enter a Password',
                            label: 'Password',
                            icon: Icons.key,
                            action: TextInputAction.next),
                        RegisterForm(
                            controller: confirmPassword,
                            hint: 'Confirm Password',
                            label: 'Confirmation',
                            icon: Icons.password,
                            action: TextInputAction.done,
                            validator: (value) {
                              if (value != password.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            }),
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
                                    register();
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                  )),
                            )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: TextStyle(color: Colors.white.withOpacity(0.6))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, FadeAnim(page: const LoginPage()));
                      },
                      child: Text('Login here!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.withOpacity(0.6),
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue.withOpacity(0.6))),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
