import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_peace/controller/util/home_controller.dart';
import 'package:world_peace/core/constant/image.dart';
import 'package:world_peace/core/function/pop_menu.dart';
import 'package:world_peace/core/shared/save_data.dart';
import 'package:world_peace/model/post.dart';
import 'package:world_peace/view/screen/bottom/profile_screen.dart';

class FeaturePost extends StatelessWidget {
  final int index;
  final AsyncSnapshot<ObjectPost> snapshot;

  const FeaturePost({Key? key, required this.index, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImageUrl.person1),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => ProfilePage(
                          idUser: snapshot.data!.data!.data![index].userId!,
                        ),
                      );
                    },
                    child: Text(
                      snapshot.data!.data!.data![index].user!.name.toString(),
                      style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    snapshot.data!.data!.data![index].createdAtFormatted
                        .toString(),
                    style: GoogleFonts.montserrat(color: Colors.grey),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                child: AppPreferences().userId ==
                        snapshot.data!.data!.data![index].userId
                    ? showPopMenu(
                        onSelected: (select) => controller.onSelected(
                            select, snapshot.data!.data!.data![index].id))
                    : null,
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            snapshot.data!.data!.data![index].title!,
            style:
                GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 17.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            snapshot.data!.data!.data![index].description!,
            style: GoogleFonts.cairo(fontSize: 17.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      );
    });
  }
}
