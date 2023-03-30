import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, required this.function});

  final String name;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30).r),
            padding: const EdgeInsets.all(20)),
        child: Text(
          name,
          style: GoogleFonts.ubuntu(fontSize: 17.sp,fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
