import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_peace/view/screen/bottom/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:world_peace/view/screen/utils/messages_screen.dart';
import 'package:world_peace/view/screen/utils/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.7, 856.7),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: MessagesScreen(),
          );
        });
  }
}
