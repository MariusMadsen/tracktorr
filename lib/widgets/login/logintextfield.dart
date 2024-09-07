import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.obscured,
      required this.icon});

  final TextEditingController controller;
  final String placeholder;
  final bool obscured;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            fillColor: const Color.fromRGBO(71, 26, 94, 1),
            filled: true,
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey)),
        obscureText: obscured,
      ),
    );
  }
}
