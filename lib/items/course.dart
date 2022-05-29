import 'package:online_learning/items/course_material.dart';

class Course {
  late String teacher;
  late List<CourseMaterial> materials;

  Course(String teacher, List<CourseMaterial> materials) {
    this.teacher = teacher;
    this.materials = materials;
  }
}
