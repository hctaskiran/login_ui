import 'package:flutter/material.dart';
import 'package:login_ui/components/register_form.dart';
import 'package:login_ui/page/auth/auth_service.dart';

class RegisterPageForms extends StatelessWidget {
  const RegisterPageForms({
    Key? key,
    required this.email,
    required this.password,
    required this.confirmPassword,
  }) : super(key: key);

  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text('Register and share your moments!', style: TextStyle(color: Colors.white.withOpacity(0.6))),
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
                    isSemanticButton: false,
                    onPressed: () {
                      signUserUp(context, email, password, confirmPassword);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
