import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/BibleController.dart';

class Bible extends StatefulWidget {
  const Bible({Key? key}) : super(key: key);

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  final BibleController controller = Get.put(BibleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: GetBuilder<BibleController>(builder: (controller) {
          if (controller.bibleData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: controller.bibleData.length,
              itemBuilder: (context, index) {
                List<dynamic> chapter = controller.bibleData[index]['CHAPTER'];
                return ExpansionTile(
                  title: Text(controller.bibleData[index]['name']),
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
                        return Center(child: Text(chapter[index]['cnumber']));
                        })
                  ],
                );
              });
        }),
      ),
    );
  }
}
