import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/project_content_widgets/highlight_project_screenshot.dart';
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
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        !widget.selected
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
                    showCustomOverlay(context);
                    //_index = (_index + 1) % widget.screenshots.length;
                  });
                },
              ),
        widget.selected
            ? InkWell(
                onTap: () {
                  showCustomOverlay(context);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 20),
                      child: Text("Voir plus",
                          style:
                              AppTextStyles.textMSemiBold(color: Colors.white)),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }

  void showCustomOverlay(BuildContext context) {
    overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        child: Material(
          color: Colors.transparent,
          child: HightlightProjectScreenshot(
            screenshots: widget.screenshots,
            onExit: () {
              overlayEntry?.remove();
            },
          ),
        ),
      ),
    );
    if (overlayEntry != null) {
      overlayState?.insert(overlayEntry!);
    }
  }
}
