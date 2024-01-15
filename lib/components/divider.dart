import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 1,
          width: screenWidth * 0.3,
          color: Colors.white.withOpacity(0.6),
        ),
        Text(
          'OR',
          style: TextStyle(color: Colors.white.withOpacity(0.6)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          height: 1,
          width: screenWidth * 0.3,
          color: Colors.white.withOpacity(0.6),
        ),
      ],
    );
  }
}
