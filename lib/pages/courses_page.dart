import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';
import 'package:online_learning/items/course_material.dart';
import 'package:online_learning/screens/course_screen.dart';
import '../items/all_courses_list.dart';
import '../items/course.dart';
import '../items/courses_list.dart';

import '../widgets/course_list_tile.dart';
import '../widgets/search_bar.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<Course> shownCourses = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      shownCourses = courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'My Courses',
                style: TextStyle(
                  fontSize: kTitleFontSize,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SearchBar(
              onChanged: (String s) {
                setState(
                  () {
                    if (s.isEmpty) {
                      shownCourses = courses;
                    } else {
                      shownCourses = courses.where((course) => course.name.toLowerCase().contains(s.toLowerCase())).toList();
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: shownCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return CourseListTile(
                    course: shownCourses[index],
                    onGoBack: () {
                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
