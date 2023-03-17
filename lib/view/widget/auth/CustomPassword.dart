import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPassword extends StatelessWidget {
  const CustomPassword({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.label,
    this.function,
  });

  final bool obscureText;
  final String label;
  final TextEditingController controller;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "The field is empty !";
        } else if (value.length < 8) {
          return "The password is too short !";
        }
      },
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(fontFamily: "Roboto", color: Colors.black),
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.cairo(),
          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
          suffixIcon: InkWell(
            onTap: function,
            child: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: BorderSide(color: Colors.black.withOpacity(0.4)))),
    );
  }
}
