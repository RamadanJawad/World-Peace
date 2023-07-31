import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

showCustomSnackBar(
    {required BuildContext context,
    required ContentType contentType,
    required String title,
    required String message}) {
  var snackBar = SnackBar(
    elevation: 0,
    margin: const EdgeInsets.all(5),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
