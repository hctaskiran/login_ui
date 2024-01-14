import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';

class ResetAndSignUp extends StatelessWidget {
  const ResetAndSignUp(
      {super.key, required this.check, required this.clickable, required this.page, required this.mainAlign});
  final String check;
  final String clickable;
  final Widget page;
  final MainAxisAlignment mainAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAlign,
      children: [
        Text(check, style: TextStyle(color: Colors.white.withOpacity(0.6))),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, FadeAnim(page: page));
          },
          child: Text(clickable,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.withOpacity(0.6),
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue.withOpacity(0.6))),
        ),
      ],
    );
  }
}
