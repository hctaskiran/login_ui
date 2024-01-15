// auth_service.dart

// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';
import 'package:login_ui/page/login_page.dart';

Future<void> signUserIn(BuildContext context, TextEditingController email, TextEditingController password) async {
  showDialog(
    context: context,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  void errorShow(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[700]!.withOpacity(0.3),
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      errorShow('No user found for that email, please check again');
    } else if (e.code == 'wrong-password') {
      errorShow('Wrong password, please check again');
    } else if (e.code == 'invalid-email') {
      errorShow('Invalid email, please check again');
    } else {
      errorShow('Something went wrong, please try again later');
    }
  }

  Navigator.pop(context);
}

Future<void> signUserUp(
  BuildContext context,
  TextEditingController email,
  TextEditingController password,
  TextEditingController confirmPassword,
) async {
  showDialog(
    context: context,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[700]!.withOpacity(0.3),
        content: const Text('Account created successfully'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void errorShow(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[700]!.withOpacity(0.3),
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  try {
    if (password.text == confirmPassword.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // Close the loading dialog
      Navigator.pop(context);

      // Show success Snackbar
      showSuccessSnackbar();

      // Navigate to the LoginPage after successful sign-up
      Navigator.pushReplacement(context, FadeAnim(page: const LoginPage()));
    } else {
      // Close the loading dialog
      Navigator.pop(context);
      errorShow('Passwords do not match');
    }
  } on FirebaseAuthException catch (e) {
    // Close the loading dialog
    Navigator.pop(context);
    errorShow('Error creating account: ${e.message}');
    print(e.code);
  }
}
