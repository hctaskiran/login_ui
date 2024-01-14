import 'package:flutter/material.dart';
import 'package:login_ui/anim/fade_anim.dart';

class TermOfServiceText extends StatelessWidget {
  const TermOfServiceText({
    Key? key,
    required this.check,
    required this.clickable,
    required this.page,
  });
  final String check;
  final String clickable;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Column(
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
