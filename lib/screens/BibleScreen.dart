import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/BibleController.dart';
import 'BibleText.dart';

class Bible extends StatefulWidget {
  const Bible({Key? key}) : super(key: key);

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  final BibleController controller = Get.put(BibleController());
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: const Text("NT")),
            const SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: const Text("OT"),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:
            currentIndex == 0 ? _buildOldTestaments() : _buildNewTestaments(),
      ),
    );
  }

  Widget _buildOldTestaments() {
    return Container(
      child: GetBuilder<BibleController>(builder: (controller) {
        if (controller.oldTestament.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: controller.oldTestament.length,
            itemBuilder: (context, index) {
              List<dynamic> chapter = controller.oldTestament[index]['CHAPTER'];
              final book = controller.oldTestament[index]['name'];
              return ExpansionTile(
                title: Text(controller.oldTestament[index]['name']),
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 2,
                      ),
                      itemCount: chapter.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                controller.book.value = book;
                                controller.currentChapter.value =
                                    int.parse(chapter[index]['cnumber']);
                              });
                              Get.to(
                                () => BibleTextReader(
                                  chapter: chapter[index]['VERS'],
                                ),
                              );
                            },
                            child: Text(chapter[index]['cnumber']),
                          ),
                        );
                      })
                ],
              );
            });
      }),
    );
  }

  Widget _buildNewTestaments() {
    return GetBuilder<BibleController>(builder: (controller) {
      if (controller.newTestament.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
          itemCount: controller.newTestament.length,
          itemBuilder: (context, index) {
            List<dynamic> chapter = controller.newTestament[index]['CHAPTER'];
            final book = controller.newTestament[index]['name'];
            return ExpansionTile(
              title: Text(controller.newTestament[index]['name']),
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 2,
                    ),
                    itemCount: chapter.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              controller.book.value = book;
                              controller.currentChapter.value =
                                  int.parse(chapter[index]['cnumber']);
                            });
                            Get.to(
                              () => BibleTextReader(
                                chapter: chapter[index]['VERS'],
                              ),
                            );
                          },
                          child: Text(chapter[index]['cnumber']),
                        ),
                      );
                    })
              ],
            );
          });
    });
  }
}
