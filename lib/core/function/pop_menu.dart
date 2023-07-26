import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

Widget showPopMenu({void Function(int)? onSelected}) {
  return PopupMenuButton<int>(
      onSelected: onSelected,
      elevation: 1,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "delete",
                    style: GoogleFonts.cairo(color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
          ]);
}
