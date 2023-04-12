import 'package:flutter/material.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content:SizedBox(
        height: 100.0,
        width: 100.0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

