// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key, required this.controller, required this.hint, required this.label, required this.icon});
  final TextEditingController controller;
  final String hint;
  final String label;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: controller,
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
