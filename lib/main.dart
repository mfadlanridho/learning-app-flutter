import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/items/all_courses_list.dart';
import 'package:online_learning/screens/onboarding_screen.dart';
import 'package:online_learning/screens/signup_screen.dart';

import 'items/course.dart';
import 'items/course_material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UpdateAllCoursesList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}
