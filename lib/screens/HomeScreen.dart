import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/ThemeController.dart';
import 'BibleScreen.dart';
import 'Dashboard.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.put(ThemeController());

int currentScreen = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _buildBottomSheet(),
      body: currentScreen == 0 ? const DashBoard() : currentScreen == 3 ? const Bible() : Container(),
    );
  }
  Widget _buildBottomSheet(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.6), // Set the color of the top border here
            width: 1.0, // Set the width of the top border here
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:12.0,right:12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             GestureDetector(
                 onTap: (){
                   setState(() {
                     currentScreen = 0;
                   });
                 },
                 child:  Icon(LineIcons.home,color: currentScreen == 0 ? Colors.green : null)),
             const Icon(LineIcons.search),
             const Icon(LineIcons.bookmark),
             GestureDetector(
                 onTap:(){
                   setState(() {
                     currentScreen = 3;
                   });
                 },
                 child:  Icon(LineIcons.book,color: currentScreen == 3 ? Colors.green : null)),
                  const Icon(LineIcons.user),


          ],
        ),
      ),

    );
  }


}



