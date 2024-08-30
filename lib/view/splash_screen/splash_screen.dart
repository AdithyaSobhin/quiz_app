import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/utilis/image_constants.dart';
import 'package:quiz_app/view/category_screen/category_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 200, 253),
      body: Expanded(
        child: Center(
          child: Image.asset(
            ImageConstants.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
