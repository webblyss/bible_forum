import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/hex_color.dart';


class PrayersForum extends StatefulWidget {
  const PrayersForum({Key? key}) : super(key: key);

  @override
  State<PrayersForum> createState() => _PrayersForumState();
}

class _PrayersForumState extends State<PrayersForum> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children :  [
        const Padding(
          padding:  EdgeInsets.only(left:12.0),
          child:  Text("Trending",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        ),
        ListView.builder(
          shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context,index){
          return Column(
            children: [
              ListTile(
                onTap: (){},
                leading: const CircleAvatar(
                  radius:18,
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1594842084383-04c2194e6216?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bG9zdCUyMHNoZWVwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                ),
                title : const Text("Faith Turbulence"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const[
                    Icon(LineIcons.user),
                     Text("2.5k")
                  ],
                ),
              ),
              const Divider()
            ],
          );
        })
      ]
    );
  }

}




