import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/profile_controller.dart';
import 'package:world_peace/core/api/api_profile.dart';
import 'package:world_peace/core/constant/color.dart';
import 'package:world_peace/core/constant/image.dart';

class ProfilePage extends StatelessWidget {
  final int idUser;

  const ProfilePage({
    super.key,
    required this.idUser,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: ApiProfileController().profilePage(idUser: idUser),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text("No Internet Connection !"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: () async {
                    controller.refreshData(idUser);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        color: AppColor.primaryColor,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  const AssetImage(ImageUrl.person2),
                              radius: 35.r,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              snapshot.data!.name.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                            Text(
                              snapshot.data!.email.toString(),
                              style: GoogleFonts.cairo(
                                  fontSize: 17.sp, color: Colors.white),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColor.primaryColor),
                              onPressed: () {},
                              child: Text(
                                "follow",
                                style: GoogleFonts.cairo(fontSize: 17.sp),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("no data"));
              }
            },
          ),
        );
      },
    );
  }
}
