import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/items/all_courses_list.dart';
import 'package:online_learning/items/course.dart';
import 'package:online_learning/items/course_material.dart';

List<Course> courses = <Course>[];

void UpdateCoursesList() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
  courses = [];

  for (QueryDocumentSnapshot user in snapshot.docs) {
    if (user['email'] == FirebaseAuth.instance.currentUser!.email) {
      List<dynamic> myCourses = user['courses'];
      for (var obj in myCourses) {
        String courseId = obj['id'];
        print(courseId);
        Course findCourse = allCourses.firstWhere((element) => element.id == courseId, orElse: () => Course());
        for (Course course in allCourses) {
          print("id:" + course.id);
        }
        print("findCourse:" + findCourse.id);
        if (findCourse.id != '') {
          courses.add(findCourse);
        }
      }
    }
    print("User: " + user['email'].toString());
  }
}
