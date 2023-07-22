import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

Widget showPopMenu({void Function(int)? onSelected}) {
  return PopupMenuButton<int>(
      onSelected: onSelected,
      itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Text(
                "delete",
                style: GoogleFonts.cairo(color: AppColor.primaryColor),
              ),
            ),
          ]);
}
