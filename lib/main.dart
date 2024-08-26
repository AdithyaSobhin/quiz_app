import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/view/category_screen/category_screen.dart';
import 'package:quiz_app/view/quiz_screen/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryScreen(),
    );
  }
}
