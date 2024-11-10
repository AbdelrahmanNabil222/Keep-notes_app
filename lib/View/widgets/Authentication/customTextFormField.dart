import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.prefixicon,
    required this.controller,
    required this.validator,
    this.obscuretext = false,
    this.suffixIcon,
  });
  final String hinttext;
  final IconData prefixicon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscuretext;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        obscureText: obscuretext,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hinttext,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Icon(
              prefixicon,
            ),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
