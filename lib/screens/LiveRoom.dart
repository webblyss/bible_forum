import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/ThemeController.dart';

class LiveRoom extends StatefulWidget {
  const LiveRoom({super.key});

  @override
  State<LiveRoom> createState() => _LiveRoomState();
}

class _LiveRoomState extends State<LiveRoom> {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.put(ThemeController());
    return Theme(
      data: _themeController.theme,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
