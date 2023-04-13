import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BibleController extends GetxController {
  var bibleData = <dynamic>[].obs;
  var book = ''.obs;
  var bookChapter = ''.obs;
  var currentChapter = 1.obs;
  var totalChapters = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    final jsonStr = await rootBundle.loadString('assets/bible_kjv.json');
    final jsonData = jsonDecode(jsonStr);
    bibleData.value = jsonData;
    totalChapters.value = getBookChapterCount(book.value);
  }

  void nextChapter() {
    if (currentChapter.value < totalChapters.value) {
      currentChapter.value++;
      bookChapter.value = getChapterData(book.value, currentChapter.value);
    }
  }

  void previousChapter() {
    if (currentChapter.value > 1) {
      currentChapter.value--;
      bookChapter.value = getChapterData(book.value, currentChapter.value);
    }
   }

  int getBookChapterCount(String bookName) {
    final bookData = bibleData.firstWhere((book) => book['name'] == bookName);
    return bookData['CHAPTER'];
  }

  String getChapterData(String bookName, int chapterNumber) {
    final bookData = bibleData.firstWhere((book) => book['name'] == bookName);
    final chapterData = bookData['chapters'][chapterNumber - 1];
    return chapterData;
  }
}
