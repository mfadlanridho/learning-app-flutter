import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_learning/items/course.dart';
import 'package:online_learning/items/course_material.dart';
import 'package:online_learning/widgets/button.dart';
import 'package:online_learning/widgets/material_list_tile.dart';

import '../constants.dart';
import '../items/courses_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseScreen extends StatefulWidget {
  final Course course;
  const CourseScreen({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int selectedIndex = 0;

  void GetCourse() async {
    courses.add(widget.course);
    String email = FirebaseAuth.instance.currentUser!.email!;

    List updatedCourses = [];
    for (Course course in courses) {
      updatedCourses.add({'id': course.id});
    }

    FirebaseFirestore.instance.collection('users').doc(email).set({'email': email, 'courses': FieldValue.arrayUnion(updatedCourses)});
    UpdateCoursesList();

    setState(() {
      courses.add(widget.course);
    });
  }

  void RemoveCourse() {
    courses.remove(widget.course);
    String email = FirebaseAuth.instance.currentUser!.email!;

    List updatedCourses = [];
    for (Course course in courses) {
      updatedCourses.add({'id': course.id});
    }

    FirebaseFirestore.instance.collection('users').doc(email).update({'email': email, 'courses': updatedCourses});
    UpdateCoursesList();

    setState(() {
      courses.remove(widget.course);
    });
  }

  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.course.materials[0].url,
    flags: YoutubePlayerFlags(
      hideControls: true,
      hideThumbnail: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE7EE),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.course.name,
                    style: TextStyle(
                      fontSize: kTitleFontSize,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.course.teacher,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.course.materials.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MaterialListTile(
                          material: widget.course.materials[index],
                          index: index,
                          onTap: () => setState(() {
                            _controller.load(widget.course.materials[index].url);
                            selectedIndex = index;
                          }),
                          color: selectedIndex == index ? Colors.blueAccent : null,
                          padding: selectedIndex == index ? 5 : 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            !courses.contains(widget.course)
                ? ElevatedButton(
                    onPressed: GetCourse,
                    child: Text(
                      "Get Course",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: RemoveCourse,
                    child: Text(
                      "Remove Course",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
