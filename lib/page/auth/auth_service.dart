// auth_service.dart

// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';
import 'package:login_ui/page/home_page.dart';

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
      Navigator.pop(context);
      Navigator.pushReplacement(context, FadeAnim(page: HomeView()));
    } else {
      Navigator.pop(context);
      errorShow('Passwords do not match');
    }
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);

    errorShow('${e.message}');
    print(e.code);
  }
}

Future resetPassword(email, BuildContext context) async {
  void errorShow(String errorMessage, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    errorShow('Recover link sent! Check your mailbox.', Colors.green[700]!.withOpacity(0.3));
  } on FirebaseException catch (e) {
    if (e.code == 'user-not-found') {
      errorShow('No user found for that email.', Colors.red[700]!.withOpacity(0.3));
    } else if (e.code == 'missing-email') {
      errorShow('Email field cannot be empty', Colors.red[700]!.withOpacity(0.3));
    } else if (e.code == 'invalid-email') {
      errorShow('Invalid email, please check again', Colors.red[700]!.withOpacity(0.3));
    } else {
      errorShow(e.code, Colors.red[700]!.withOpacity(0.3));
    }
  }
}
