import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BibleController extends GetxController {
  var bibleData = <dynamic>[].obs;

  @override
  void onInit() async {
    super.onInit();
    final jsonStr = await rootBundle.loadString('assets/bible_kjv.json');
    final jsonData = jsonDecode(jsonStr);
    bibleData.value = jsonData;
  }
}