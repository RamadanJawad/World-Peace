import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

void showUpdateDialog(
    {void Function()? onConfirm, TextEditingController? controller}) {
  Get.defaultDialog(
    title: "Update comment",
    barrierDismissible: true,
    
    content: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        labelText: "new comment",
        floatingLabelStyle: GoogleFonts.ubuntu(color: AppColor.primaryColor),
        labelStyle: GoogleFonts.cairo(),
        focusedErrorBorder: OutlineInputBorder(
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
    ),
    cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColor.primaryColor),
        child: Text(
          "Cancel",
          style: GoogleFonts.cairo(fontSize: 16.sp),
        )),
    confirm: ElevatedButton(
        onPressed: onConfirm,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
        ),
        child: Text(
          "Confirm",
          style: GoogleFonts.cairo(fontSize: 16.sp),
        )),
  );
}
