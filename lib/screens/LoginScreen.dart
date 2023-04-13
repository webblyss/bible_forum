import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../provider/AuthController.dart';
import '../widget/LoadingWidget.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.put(AuthController());
  late VideoPlayerController controller;
  bool _isChecked = false;



 @override
  void initState() {
    controller = VideoPlayerController.asset("assets/intro.mp4")..initialize().then((value) {
      setState(() {

      });
    } );
    controller.setLooping(true);
    controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          VideoPlayer(controller),
          Center(
            child: GestureDetector(
              onTap: loginWithGoogle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40,
                    decoration:  BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                            Icon(FontAwesomeIcons.google),
                          Text("Continue with google")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40,
                    decoration:  BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.green],
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(FontAwesomeIcons.apple),
                          Text("Continue with Apple")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    subtitle: const Text("By checking your agree to our terms and conditions If you disagree with any part of the Terms, then you may not access the app.",style:TextStyle(color:Colors.white,fontSize: 12)),
                    leading: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> loginWithGoogle() async {
  if (!_isChecked) {
    return Get.snackbar(
      "Error",
      "Agree to terms and condition",
      backgroundColor: Colors.greenAccent,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black
    );
  }

  try {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const LoadingPopup();
      },
    );
    
    final userCredential = await _authController.signInWithGoogle();
    
    if (userCredential != null) {
      Get.to(() => const HomeScreen(), transition: Transition.cupertino);
    } 
  } catch (e) {
    // Handle the error here
  } finally {
    // Close the loading popup
    Navigator.of(context).pop();
    Get.to(() => const HomeScreen(), transition: Transition.cupertino);
  }

  return null;
}



}


