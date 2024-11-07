import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageOrSvgImage extends StatelessWidget {
  String assetPath;
  double? height;
  double? width;

  ImageOrSvgImage({required this.assetPath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    bool isSvg = assetPath.contains(".svg");
    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        height: height,
        width: width,
      );
    } else {
      return Image.asset(
        assetPath,
        height: height,
        width: width,
      );
    }
  }
}
