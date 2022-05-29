import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/items/course.dart';
import 'package:online_learning/items/course_material.dart';

List<Course> allCourses = <Course>[
  // Course(
  //   id: "c001",
  //   teacher: "Sebastian Lague",
  //   name: "Unity: Create a Game",
  //   materials: [
  //     CourseMaterial(url: "SviIeTt2_Lc", title: "Introduction", description: "description"),
  //     CourseMaterial(url: "jdv8erC7ML8", title: "Player Controller", description: "description"),
  //     CourseMaterial(url: "rZAnnyensgs", title: "Gun System", description: "description"),
  //     CourseMaterial(url: "UnPZyFjUvOM", title: "Enemies", description: "description"),
  //     CourseMaterial(url: "v0zVBtZpB-8", title: "Damage System", description: "description"),
  //   ],
  //   imgURL: 'https://www.gamelab.id/uploads/news/berita-211-berkenalan-dengan-fitur-fitur-unity-3d-20200716-153311.png',
  // ),
  // Course(
  //   id: "c002",
  //   teacher: "sentdex",
  //   name: "Python3 Programming",
  //   materials: [
  //     CourseMaterial(url: "oVp1vrfL_w4", title: "Why Python3?", description: "description"),
  //     CourseMaterial(url: "IX6mc9l6tY4", title: "How to install", description: "description"),
  //     CourseMaterial(url: "UsCQXe1OHZk", title: "Print Function and Strings", description: "description"),
  //     CourseMaterial(url: "BvgPM9-krOY", title: "Math", description: "description"),
  //     CourseMaterial(url: "vKqVnr0BEJQ", title: "Variables", description: "description"),
  //   ],
  //   imgURL: 'https://www.starzel.de/blog/four-options-to-try-plone-5-2-on-python-3/@@images/408ce502-79d9-4544-99af-472a1ff832f8.png',
  // )
];

void UpdateAllCoursesList() async {
  await Firebase.initializeApp();
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('courses').get();
  for (QueryDocumentSnapshot course in snapshot.docs) {
    List<CourseMaterial> materials = <CourseMaterial>[];
    for (var element in course['materials']) {
      materials.add(CourseMaterial(url: element['url'], title: element['title']));
    }
    Course newCourse = Course(id: course.id, teacher: course['teacher'], name: course['name'], imgURL: course['imgURL'], materials: materials);
    allCourses.add(newCourse);
    print(allCourses);
  }
}
