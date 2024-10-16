import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final String buttonText;
  final Future Function() onPressed;

  LoadingButton({required this.buttonText, required this.onPressed});

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;
  double _progress = 0.0;

  void _startLoading() async {
    setState(() {
      _isLoading = true;
      _progress = 0.0;
    });
    widget
        .onPressed()
        .then((value) => {
              setState(() {
                _isLoading = false;
              })
            })
        .onError((error, stackTrace) => {
              setState(() {
                _isLoading = false;
              })
            });
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      setState(() {
        _progress = i / 100.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Progress: $_progress");
    return InkWell(
      onTap: _isLoading ? null : _startLoading,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: myLightColorScheme.secondaryContainer,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.buttonText,
                style: AppTextStyles.textLSemiBold(
                    color: myLightColorScheme.onSecondaryContainer),
              ),
            ),
            if (_isLoading)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: LinearProgressIndicator(
                  value: _progress,
                  minHeight: 48,
                  backgroundColor: Colors.transparent,
                  color: myLightColorScheme.primary.withAlpha(70),
                ),
              )
          ],
        ),
      ),
    );
  }
}
