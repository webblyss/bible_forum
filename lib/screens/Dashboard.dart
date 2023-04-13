import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/AuthController.dart';
import '../utils/ThemeController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/hex_color.dart';
import 'PrayerForum.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final ThemeController _themeController = Get.put(ThemeController());
  final AuthController _authController = Get.find<AuthController>();

  late int _tabIndex;

  @override
  void initState() {
    _tabIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeController.theme,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4="),
                    ),
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          _themeController.isDarkMode.value
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                        onPressed: () {
                          setState(() {
                            _themeController.toggleTheme();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  _buildCard(
                      text: const Text("Feeds"),
                      callback: () {
                        setState(() {
                          _tabIndex = 0;
                        });
                      },
                      color: _tabIndex == 0
                          ? Colors.blue
                          : (_themeController.isDarkMode.isTrue
                              ? HexColor("#212023")
                              : HexColor("#F8F8F8"))),
                  _buildCard(
                      text: const Text("Prayers forum"),
                      callback: () {
                        setState(() {
                          _tabIndex = 1;
                        });
                      },
                      color: _tabIndex == 1
                          ? Colors.blue
                          : (_themeController.isDarkMode.isTrue
                              ? HexColor("##212023")
                              : HexColor("#F8F8F8"))),
                  _buildCard(
                      text: const Text("Bible Study forum"),
                      callback: () {},
                      color: _themeController.isDarkMode.isTrue
                          ? HexColor("##212023")
                          : HexColor("#F8F8F8")),
                  _buildCard(
                      text: const Text("Calendar"),
                      callback: () {},
                      color: _themeController.isDarkMode.isTrue
                          ? HexColor("##212023")
                          : HexColor("#F8F8F8")),
                ]),
              ),
              const Divider(
                thickness: 1.0,
              ),
              _tabIndex == 0
                  ? _buildFeedsList()
                  : _tabIndex == 1
                      ? const PrayersForum()
                      : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {required Widget text,
      required Function() callback,
      required Color color}) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8.0)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: text,
            ))),
      ),
    );
  }

  Widget _buildFeedsList() {
    List images = [
      "https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4=",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbElRxtOUBql4QWih2qIc15TRTjHWYYTMRLn1y43CBRSWQbHXTBwiWiExknS5_1h8NVc0&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnl1gUXWSLwQoDniohmUeet4-ZJErM2YcNCg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXAE0QmaotyJ-gpDEdxCBQyfQoMo9tPsGcZg&usqp=CAU"
    ];
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(images[index]),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "paul",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "For God so loved the world, that he gave his only Son, that whoever believes in him should not perish but have eternal life. For God did not send his Son into the world to condemn the world, but to save the world through him. Whoever believes in him is not condemned, but whoever does not believe is condemned already, because he has not believed in the name of the only Son of God",
                              style: TextStyle(
                                  fontSize: 14, color: HexColor("#4c4c4c")),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        LineIcons.heart,
                                        size: 18,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        LineIcons.comment,
                                        size: 18,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        LineIcons.bookmark,
                                        size: 18,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        LineIcons.share,
                                        size: 18,
                                      )),
                                ]),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      size: 18,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }
}
