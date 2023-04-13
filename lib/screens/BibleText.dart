import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/BibleController.dart';

class BibleTextReader extends StatefulWidget {
  final List<dynamic>? chapter;

  const BibleTextReader({super.key,required this.chapter});


  @override
  State<BibleTextReader> createState() => _BibleTextReaderState();
}

class _BibleTextReaderState extends State<BibleTextReader> {
  final BibleController bibleController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            const SizedBox(
              height: 30,
            ),
            _buildBibleContent()
          ],
        ),
      ),
    );
  }
  Widget _buildHeader(){
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        GestureDetector(
          onTap: () {
          },
          child: Text(
            "${bibleController.book.value} ${bibleController.bookChapter.value}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }


  Widget _buildBibleContent() {
    return Expanded(
      child: ListView.builder(
        itemCount: bibleController.getChapterData(bibleController.book.value, int.parse(bibleController.bookChapter.value)).length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {

                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("hi")
              ),
              )],
          );
        },
      ),
    );
  }
}




