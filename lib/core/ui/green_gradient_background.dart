import 'package:dicquemare_solution/core/colors.dart';
import 'package:flutter/material.dart';

class GreenGradientBackground extends StatelessWidget {
  Widget child;

  GreenGradientBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return buildWhiteBackground();
  }

  Widget buildWhiteBackground() {
    return Container(
      color: myLightColorScheme.background,
      child: child,
    );
  }

  Widget buildGreenGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.9],
          colors: [
            Colors.green[50]!,
            Colors.green[100]!,
            Colors.green[300]!,
          ],
        ),
      ),
      child: child,
    );
  }
}
