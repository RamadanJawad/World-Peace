import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/core/constant/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Search ",
          style: GoogleFonts.cairo(fontSize: 20.sp, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          style: GoogleFonts.cairo(fontSize: 17.sp),
          cursorColor: AppColor.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(13),
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            hintStyle: GoogleFonts.cairo(fontSize: 17.sp),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
          ),
        ),
      ),
    );
  }
}
