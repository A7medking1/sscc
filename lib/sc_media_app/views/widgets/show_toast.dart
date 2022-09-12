
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToastStates { SUCCESS, ERROR, WARNING }


void showToast(String body,ToastStates state){
  Get.snackbar(
    body,
    "",
    colorText: Colors.white,
    backgroundColor: chooseToastColor(state),
    snackPosition: SnackPosition.BOTTOM,
  );
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}