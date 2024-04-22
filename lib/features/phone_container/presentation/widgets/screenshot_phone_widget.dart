import 'package:flutter/material.dart';

class ScreenshotPhoneWidget extends StatefulWidget {
  final List<String> screenshots;
  bool selected;


  ScreenshotPhoneWidget({
    required this.screenshots,
    this.selected = true,
  });

  @override
  State<StatefulWidget> createState() => _ScreenshotPhoneWidgetState();
}

class _ScreenshotPhoneWidgetState extends State<ScreenshotPhoneWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return !widget.selected
        ? Image.asset(
            widget.screenshots[_index],
            fit: BoxFit.cover,
          )
        : GestureDetector(
            child: Image.asset(
              widget.screenshots[_index],
              fit: BoxFit.cover,
            ),
            onTap: () {
              setState(() {
                _index = (_index + 1) % widget.screenshots.length;
              });
            });
  }
}
