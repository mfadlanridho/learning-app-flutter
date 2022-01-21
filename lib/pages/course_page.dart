import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';

import '../widgets/search_bar.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course',
                  style: TextStyle(
                    fontSize: kTitleFontSize,
                  ),
                ),
                CircleAvatar(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SearchBar(),
            SizedBox(height: 15),
            Text(
              'Courses',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15),
            CourseSelection(),
            SizedBox(height: 15),
            CourseListTile()
          ],
        ),
      ),
    );
  }
}

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(
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
                'Product Design v1.0',
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
                    'Robertson Connie',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffB8B8D2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '\$190',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff3D5CFF),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 60,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xffFFEBF0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '16 hours',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffFF6905),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CourseSelection extends StatelessWidget {
  const CourseSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CourseSelectionButton(),
        SizedBox(width: 10),
        CourseSelectionButton(),
        SizedBox(width: 10),
        CourseSelectionButton(),
      ],
    );
  }
}

class CourseSelectionButton extends StatelessWidget {
  const CourseSelectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xff3D5CFF),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
      ),
    );
  }
}
