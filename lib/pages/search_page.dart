import 'package:flutter/material.dart';
import 'package:online_learning/items/all_courses_list.dart';
import 'package:online_learning/widgets/search_bar.dart';

import '../constants.dart';
import '../items/course.dart';
import '../widgets/course_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Course> shownCourses = [];

  @override
  void initState() {
    super.initState();
    shownCourses = allCourses;
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
                'Find Courses',
                style: TextStyle(
                  fontSize: kTitleFontSize,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: SearchBar(
                onChanged: (String s) {
                  setState(
                    () {
                      if (s.isEmpty) {
                        shownCourses = allCourses;
                      } else {
                        shownCourses = allCourses.where((course) => course.name.toLowerCase().contains(s.toLowerCase())).toList();
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: shownCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  return CourseListTile(course: allCourses[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
