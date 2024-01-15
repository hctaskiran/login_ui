import 'package:flutter/material.dart';
import 'package:login_ui/components/login_form.dart';

class LoginPageForms extends StatefulWidget {
  const LoginPageForms({
    Key? key,
    required this.email,
    required this.password,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController email;
  final TextEditingController password;
  final Function()? onPressed;

  @override
  State<LoginPageForms> createState() => _LoginPageFormsState();
}

class _LoginPageFormsState extends State<LoginPageForms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text('Login to see what others have done!', style: TextStyle(color: Colors.white.withOpacity(0.6))),
        const SizedBox(height: 20),
        LoginForm(
          controller: widget.email,
          hint: 'Enter an Email',
          label: 'Email',
          icon: Icons.email,
          action: TextInputAction.next,
        ),
        LoginForm(
            controller: widget.password,
            hint: 'Enter a Password',
            label: 'Password',
            icon: Icons.key,
            action: TextInputAction.done),
        const SizedBox(height: 10),
        Container(
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  )),
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
