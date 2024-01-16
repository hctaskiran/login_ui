import 'package:flutter/material.dart';
import 'package:login_ui/components/login_form.dart';

class ResetPageForm extends StatefulWidget {
  const ResetPageForm({
    Key? key,
    required this.email,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController email;
  final Function()? onPressed;

  @override
  State<ResetPageForm> createState() => _ResetPageFormState();
}

class _ResetPageFormState extends State<ResetPageForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text('We\'ll send a recover link to the mail below', style: TextStyle(color: Colors.white.withOpacity(0.6))),
        const SizedBox(height: 20),
        LoginForm(
          controller: widget.email,
          hint: 'Enter your email',
          label: 'Email',
          icon: Icons.email,
          action: TextInputAction.next,
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
                  onPressed: widget.onPressed,
                  child: Text(
                    'Recover',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  )),
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}
