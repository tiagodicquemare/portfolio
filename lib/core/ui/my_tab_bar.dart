import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

const MY_TAB_BAR_HEIGHT = 52.0;

class MyTabBar extends StatefulWidget {
  final TabController tabController;

  MyTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    var widthAppBar = MediaQuery.of(context).size.width / 2.5;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MY_TAB_BAR_HEIGHT,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.tabController.animateTo(0);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 16),
                    Image.asset(MyAssets.onlyPlekoLogo, width: 52),
                    const SizedBox(width: 8),
                    Text(
                      "Dicquemare Solution",
                      style: AppTextStyles.textLSemiBold(
                          color: myLightColorScheme.primary),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AnimatedTabBar(
                tabController: widget.tabController,
                width: widthAppBar,
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: myLightColorScheme.onPrimaryContainer.withOpacity(0.1),
        ),
      ],
    );
  }
}
