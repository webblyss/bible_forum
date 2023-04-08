import 'package:bible_forum/screens/HomeScreen.dart';
import 'package:bible_forum/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialRoute: "/",
      routes: {
        "/": (context)=> const LoginScreen(),
      },
    );
  }
}
