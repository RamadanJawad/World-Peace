import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

void showUpdateDialog({void Function()? onConfirm,TextEditingController? controller}) {
  Get.defaultDialog(
    title: "Update comment",
    textConfirm: "Confirm",
    textCancel: "Cancel",
    barrierDismissible: false,
    content: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
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
    onConfirm: onConfirm,
  );
}
