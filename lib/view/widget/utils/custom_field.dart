import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

Widget customField(TextEditingController controller, String hint,
    void Function(String)? onChanged) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      style: GoogleFonts.cairo(fontSize: 17.sp),
      textDirection: TextDirection.ltr,
      onChanged: onChanged,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: const Icon(Icons.search),
        hintText: hint,
        prefixIconColor: AppColor.primaryColor,
        hintStyle: GoogleFonts.cairo(fontSize: 17.sp),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10).r),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10).r),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10).r),
      ),
    ),
  );
}
