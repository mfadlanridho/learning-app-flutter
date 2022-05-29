import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../items/course.dart';
import '../screens/course_screen.dart';

class CourseListTile extends StatelessWidget {
  final Course course;
  final Function? onGoBack;

  const CourseListTile({Key? key, required this.course, this.onGoBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseScreen(
                course: course,
              ),
            ),
          ).then((value) {
            if (onGoBack != null) {
              onGoBack!();
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Image border
                child: course.imgURL != null
                    ? Image.network(
                        course.imgURL!,
                        width: 68,
                        height: 68,
                      )
                    : Image.asset(
                        'images/course01.png',
                        width: 68,
                        height: 68,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xffB8B8D2),
                      ),
                      Text(
                        course.teacher,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffB8B8D2),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
