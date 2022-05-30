import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_learning/items/all_courses_list.dart';
import 'package:online_learning/items/course.dart';

import '../constants.dart';
import '../items/course_material.dart';
import '../screens/course_screen.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  Course course = Course();
  bool error = false;

  bool Validate() {
    if (course.name == '') return false;
    print("1");
    if (course.imgURL == '') return false;
    print("2");

    for (CourseMaterial material in course.materials) {
      if (material.title == '') return false;
      print("3");
      if (material.url == '') return false;
      print("4");
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    AddMaterial();
  }

  void AddMaterial() {
    setState(() {
      course.AddMaterial(CourseMaterial());
    });
  }

  void RemoveMaterial() {
    if (course.materials.length <= 1) return;
    setState(() {
      course.materials.removeLast();
    });
  }

  void SubmitNewCourse() async {
    List materialsList = [];
    for (CourseMaterial material in course.materials) {
      materialsList.add({
        'url': material.url,
        'title': material.title,
      });
    }

    DocumentReference docRef = await FirebaseFirestore.instance.collection('courses').add({
      'teacher': FirebaseAuth.instance.currentUser!.displayName,
      'name': course.name,
      'imgURL': course.imgURL,
      'materials': FieldValue.arrayUnion(materialsList),
    });
    UpdateAllCoursesList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Create Course',
                  style: TextStyle(
                    fontSize: kTitleFontSize,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Center(child: CircleAvatar()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputForm(
                      label: "Course Name",
                      onChanged: (String s) {
                        course.name = s;
                      },
                    ),
                    InputForm(
                      label: "Image URL",
                      onChanged: (String s) {
                        course.imgURL = s;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Materials",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: course.materials.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Material " + index.toString() + (index == 0 ? " (Introduction)" : ""),
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                InputForm(
                                  label: "Material Title",
                                  onChanged: (String s) {
                                    course.materials[index].title = s;
                                  },
                                ),
                                InputForm(
                                  label: "Material Youtube ID",
                                  onChanged: (String s) {
                                    course.materials[index].url = s;
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            RemoveMaterial();
                          },
                          icon: Icon(Icons.remove_circle),
                        ),
                        IconButton(
                          onPressed: () {
                            AddMaterial();
                          },
                          icon: Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
                        onPressed: () {
                          setState(() {
                            error = !Validate();
                            if (!error) {
                              SubmitNewCourse();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseScreen(
                                    course: course,
                                  ),
                                ),
                              ).then((value) {
                                setState(() {
                                  initState();
                                });
                              });
                            }
                          });
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                    if (error) Center(child: Text("Please fill out all the form")) else SizedBox.shrink()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;

  const InputForm({Key? key, required this.label, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: label,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
    );
  }
}
