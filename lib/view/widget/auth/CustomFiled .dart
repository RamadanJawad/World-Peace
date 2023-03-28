import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class CustomFiled extends StatelessWidget {
  const CustomFiled(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon});

  final TextEditingController controller;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      cursorColor: Colors.black,
      validator: (value) {
        if (value!.isEmpty) {
          return "The field is empty !";
        }
      },
      style: GoogleFonts.ubuntu(),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: GoogleFonts.ubuntu(color: AppColor.primaryColor),
        labelStyle: GoogleFonts.cairo(),
        prefixIcon: Icon(icon, color: Colors.grey),
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
