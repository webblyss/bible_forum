import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  IconData get themeIcon =>
      isDarkMode.value ? Icons.dark_mode : Icons.light_mode;

  ThemeData get theme => isDarkMode.value
      ? ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xff2E3136),
          accentColor: Color(0xff9D9FA2),
          scaffoldBackgroundColor: Color(0xff1F1F23),
          appBarTheme: AppBarTheme(
            color: Color(0xff2E3136),
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff2E3136),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 24.0,
          ),
        )
      : ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xff0088cc),
          accentColor: Color(0xff9D9FA2),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Color(0xff0088cc),
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff0088cc),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 24.0,
          ),
        );

  void toggleTheme() {
    isDarkMode.toggle();
    if (isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }

  void changeIcon() {
    if (isDarkMode.value) {
      isDarkMode.value = false;
    } else {
      isDarkMode.value = true;
    }
  }
}
