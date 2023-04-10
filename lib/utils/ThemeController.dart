import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = Get.isDarkMode.obs;

  void toggleTheme() {
    Get.changeThemeMode(
        isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.toggle();
  }
}


