// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.label,
      required this.icon,
      this.action,
      this.validator})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String label;
  IconData icon;
  TextInputAction? action;
  final String? Function(String?)? validator;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardAppearance: Brightness.dark,
          obscureText: widget.label == 'Password' || widget.label == 'Confirmation' ? obscureText : false,
          validator: (value) {
            if (widget.validator != null) {
              final String? validationError = widget.validator!(value);
              if (validationError != null) {
                return validationError;
              }
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
          controller: widget.controller,
          textInputAction: widget.action,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            prefixIcon: Icon(widget.icon, color: Colors.white.withOpacity(0.6)),
            suffixIcon: widget.label == 'Confirmation'
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText == true ? Icons.visibility : Icons.visibility_off,
                      color: obscureText == true ? Colors.white.withOpacity(0.6) : Colors.red[900],
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple[700]!),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[700]!),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
