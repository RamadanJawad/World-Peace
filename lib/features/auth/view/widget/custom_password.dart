import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class CustomPassword extends StatelessWidget {
  const CustomPassword({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.label,
    this.function, this.validator,
  });

  final bool obscureText;
  final String label;
  final TextEditingController controller;
  final void Function()? function;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText,
      cursorColor:Colors.grey,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: GoogleFonts.ubuntu(color: AppColor.primaryColor),
        labelStyle: GoogleFonts.ubuntu(),
        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
        suffixIcon: InkWell(
          onTap: function,
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}