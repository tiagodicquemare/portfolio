import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  final double width;
  final Color color;
  final Function? onTap;

  HoverContainer(
      {Key? key, required this.width, required this.color, this.onTap})
      : super(key: key);

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  double _height = 3;

  void _increaseHeight() {
    setState(() {
      _height = 6;
    });
  }

  void _decreaseHeight() {
    setState(() {
      _height = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      child: MouseRegion(
        onEnter: (_) => _increaseHeight(),
        onExit: (_) => _decreaseHeight(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: widget.width,
            height: _height,
            decoration: BoxDecoration(color: widget.color),
          ),
        ),
      ),
    );
  }
}
