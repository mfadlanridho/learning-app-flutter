import 'package:flutter/material.dart';
import 'package:online_learning/items/course_material.dart';

class Course {
  String id;
  String teacher;
  String name;
  List<CourseMaterial> materials = <CourseMaterial>[];
  String imgURL;

  Course({this.id = '', this.teacher = '', this.name = '', this.imgURL = '', List<CourseMaterial>? materials}) {
    if (materials != null) {
      this.materials = materials;
    }
  }

  void AddMaterial(CourseMaterial material) {
    materials.add(material);
  }
}
