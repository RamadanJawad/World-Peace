import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

void showDeleteDialog({void Function()? onConfirm}) {
  Get.defaultDialog(
    title: "Delete Comment !!",
    titleStyle: GoogleFonts.cairo(
        color: Colors.red, fontSize: 20.sp, fontWeight: FontWeight.w600),
    middleText: " Are You Sure Delete This Comment ? ",
    textConfirm: "Yes, Delete",
    textCancel: "Cancel",
    cancelTextColor: Colors.black.withOpacity(0.7),
    confirmTextColor: Colors.white,
    buttonColor: AppColor.primaryColor,
    onConfirm: onConfirm,
    barrierDismissible: false,
  );
}
