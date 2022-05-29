import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_learning/items/course_material.dart';

import '../items/course.dart';
import '../screens/course_screen.dart';

class MaterialListTile extends StatelessWidget {
  final CourseMaterial material;
  final int index;
  final void Function()? onTap;
  final Color? color;
  final double? padding;

  const MaterialListTile({Key? key, required this.material, required this.index, this.onTap, this.color, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color ?? Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0' + (index).toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffB8B8D2),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                material.title,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
