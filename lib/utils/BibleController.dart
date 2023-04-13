import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BibleController extends GetxController {
  var newTestament = <dynamic>[].obs;
  var oldTestament = <dynamic>[].obs;
  var book = ''.obs;
  var bookChapter = ''.obs;
  var currentChapter = 1.obs;
  var totalChapters = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    final oldTest = await rootBundle.loadString('assets/new_testiment.json');
    final newTest = await rootBundle.loadString('assets/old_testaments.json');
    final oldTestData = jsonDecode(oldTest);
    final newTestData = jsonDecode(newTest);
    newTestament.value = newTestData;
    oldTestament.value = oldTestData;
    totalChapters.value = getOldTestamentBookChapterCount(book.value);
  }

  void nextChapter() {
    if (currentChapter.value < totalChapters.value) {
      currentChapter.value++;
      bookChapter.value = getOldTestamentChapterData(book.value, currentChapter.value);
    }
  }

  void previousChapter() {
    if (currentChapter.value > 1) {
      currentChapter.value--;
      bookChapter.value = getOldTestamentChapterData(book.value, currentChapter.value);
    }
   }

  int getOldTestamentBookChapterCount(String bookName) {
    final bookData = oldTestament.firstWhere((book) => book['name'] == bookName);
    return bookData['CHAPTER'];
  }

  String getOldTestamentChapterData(String bookName, int chapterNumber) {
    final bookData = oldTestament.firstWhere((book) => book['name'] == bookName);
    final chapterData = bookData['chapters'][chapterNumber - 1];
    return chapterData;
  }
}
