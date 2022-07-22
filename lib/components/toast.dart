
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ToastType{
  error, success
}
toast(message,
    {
      ToastType type = ToastType.error,
      Duration? duration,
      bool isDismissible = true,
      Function? onTap,
      SnackPosition snackPosition = SnackPosition.TOP}) {
  return Get.snackbar(
    '',
    '',
    borderRadius: 10,
    duration: duration,
    titleText: Text(
      message.toString(),
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    mainButton: onTap != null
        ? TextButton(
      onPressed: () {},
      child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
    )
        : null,
    messageText: const Offstage(),
    backgroundColor: type==ToastType.error?Colors.red: Colors.green,
    snackPosition: snackPosition,
    dismissDirection: DismissDirection.horizontal,
    onTap: (snack) {},
    isDismissible: isDismissible,
  );
}