import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Course'),
              CircleAvatar(),
            ],
          ),
          SearchBar(),
          Text('Courses'),
          CourseSelection(),
          Container(
            child: Row(
              children: [
                Image.asset(
                  'images/course01.png',
                  width: 68,
                  height: 68,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Design v1.0'),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text('Robertson Connie'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('\$190'),
                        SizedBox(width: 10),
                        Container(
                          child: Text('16 hours'),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
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
        TextButton(
          onPressed: () {},
          child: Text('All'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Popular'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('New'),
        ),
      ],
    );
  }
}
