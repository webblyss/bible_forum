import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/ThemeController.dart';
import '../utils/hex_color.dart';
import 'LiveRoom.dart';

class PrayersForum extends StatefulWidget {
  const PrayersForum({Key? key}) : super(key: key);

  @override
  State<PrayersForum> createState() => _PrayersForumState();
}

class _PrayersForumState extends State<PrayersForum> {
  final ThemeController _themeController = Get.put(ThemeController());
  List<String> img = [
    "https://images.pexels.com/photos/2774546/pexels-photo-2774546.jpeg?cs=srgb&dl=pexels-luis-quintero-2774546.jpg&fm=jpg",
    "data:image/jpeg;base64,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",
    "https://www.cru.org/content/experience-fragments/shared-library/language-masters/en/train-and-grow/spiritual-growth/prayer/how-to-pray--the-beginner-s-guide/how-to-pray--the-beginner-s-guide/_jcr_content/root/image_736204372.coreimg.jpeg/1591988848534/guide-to-prayer-why.jpeg",
    "https://justdisciple.com/wp-content/uploads/2019/10/pablo-9-4-1024x512.png",
    "https://jasminpatterson.com/wp-content/uploads/2017/09/Does-Prayer-Really-Chaneg-Things-people-2598802_1920.jpg",
    "https://static.billygraham.org/sites/billygraham.org/uploads/pro/2014/05/feature-prayer.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 1.0),
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()=>Get.to(()=>const LiveRoom()),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(img[index]),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 1,
                      left: 2,
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        elevation: 2.0,
                        child: Row(
                          children: const [
                            Icon(LineIcons.eye),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("1.2k")
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 1,
                      right: 2,
                      child: Card(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.red,
                        elevation: 2.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Live",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
