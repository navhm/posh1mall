import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isEmail,
    required this.obscureText,
    required this.warning,
    Key? key}) : super(key: key);

  final IconData icon;
  final String hintText;
  final bool obscureText;
  final bool isEmail;
  final TextEditingController controller;
  final String warning;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: obscureText,
      keyboardType:
      isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,

        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white.withOpacity(.7),
        ),
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: const
        TextStyle(fontSize: 14, color: Colors.white),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return warning;
        }
        return null;
      },
    );
  }
}