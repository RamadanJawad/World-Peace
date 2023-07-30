import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

Widget showCustomPopMenu({void Function(int)? onSelected}) {
  return PopupMenuButton(
    onSelected: onSelected,
    elevation: 1,
    padding: const EdgeInsets.all(5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        value: 0,
        child: Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "F&Q",
              style: GoogleFonts.cairo(color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Row(
          children: [
            const Icon(
              Icons.logout_rounded,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Logout",
              style: GoogleFonts.cairo(color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
    ],
  );
}
