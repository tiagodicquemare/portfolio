import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/about_me_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/cv_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/my_chronology_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/technical_stack_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/testimony_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/timeline_widget.dart';
import 'package:flutter/material.dart';

class CourseContentWidget extends StatefulWidget {
  int selectedCategory;
  CourseContentWidget({required this.selectedCategory});
  @override
  State<StatefulWidget> createState() => _CourseContentWidgetState();
}

class _CourseContentWidgetState extends State<CourseContentWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.selectedCategory == 1) {
      return AboutMeWidget();
    } else if (widget.selectedCategory == 2) {
      return MyChronologyWidget();
    } else if (widget.selectedCategory == 3) {
      return TestimonyWidget();
    } else {
      return Container();
    }
  }
}
