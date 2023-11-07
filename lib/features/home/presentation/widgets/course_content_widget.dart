import 'package:flutter/material.dart';

class CourseContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CourseContentWidgetState();
}

class _CourseContentWidgetState extends State<CourseContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Parcours contenu"),
      ],
    );
  }
}
