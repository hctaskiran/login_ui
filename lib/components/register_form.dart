// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardAppearance: Brightness.dark,
          obscureText: label == 'Password' || label == 'Confirmation' ? true : false,
          validator: (value) {
            if (validator != null) {
              final String? validationError = validator!(value);
              if (validationError != null) {
                return validationError;
              }
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
          controller: controller,
          textInputAction: action,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.6)),
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
