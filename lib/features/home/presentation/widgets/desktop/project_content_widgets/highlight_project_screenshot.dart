import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/pages/smart_phone_widget.dart';
import 'package:flutter/material.dart';

class HightlightProjectScreenshot extends StatefulWidget {
  final List<String> screenshots;
  Function() onExit;

  HightlightProjectScreenshot(
      {required this.screenshots, required this.onExit});

  @override
  State<StatefulWidget> createState() => _HightlightProjectScreenshotState();
}

class _HightlightProjectScreenshotState
    extends State<HightlightProjectScreenshot> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final widthPhone = CoreUtils.getPhoneScreenWidth(context);
    final heightPhone = CoreUtils.getPhoneScreenHeight(context);
    return Container(
      color: Colors.black.withOpacity(0.9),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: _index > 0,
              replacement: const SizedBox(width: 56),
              child: IconButton(
                onPressed: () {
                  if (_index > 0) {
                    setState(() {
                      _index--;
                    });
                  }
                },
                icon: const Icon(
                  Icons.arrow_circle_left,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                GestureDetector(
                  onTap: () {
                    widget.onExit();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.close, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Fermer",
                        style: AppTextStyles.textMRegular(color: Colors.white),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: widthPhone + 3,
                  height: heightPhone + 3,
                  child: SmartphoneWidget(
                    screenshot: widget.screenshots[_index],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Visibility(
              visible: _index < widget.screenshots.length - 1,
              replacement: const SizedBox(width: 56),
              child: IconButton(
                onPressed: () {
                  if (_index < widget.screenshots.length - 1) {
                    setState(() {
                      _index++;
                    });
                  }
                },
                icon: const Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
