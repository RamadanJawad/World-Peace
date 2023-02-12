import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
        child: Text(
          "Notification Screen",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
      ),);
  }
}