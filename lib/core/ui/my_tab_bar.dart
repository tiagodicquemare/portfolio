import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

const MY_TAB_BAR_HEIGHT = 52.0;

class MyTabBar extends StatefulWidget {
  final TabController tabController;
  final bool isMobile;

  MyTabBar({Key? key, required this.tabController, required this.isMobile})
      : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  List<String> tabsText = [];
  @override
  Widget build(BuildContext context) {
    var widthAppBar = MediaQuery.of(context).size.width / 2.5;
    tabsText = [
      Languages.of(context).tabBarMyJourney,
      Languages.of(context).tabBarProjects,
      Languages.of(context).tabBarContact,
    ];
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
                    Image.asset(MyAssets.logo, width: 40),
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
              widget.isMobile
                  ? createMobileMenuBurger()
                  : AnimatedTabBar(
                      tabController: widget.tabController,
                      width: widthAppBar,
                      tabsText: tabsText,
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

  Widget createMobileMenuBurger() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu),
      onSelected: (String result) {
        if (result == tabsText[0]) {
          widget.tabController.animateTo(0);
        } else if (result == tabsText[1]) {
          widget.tabController.animateTo(1);
        } else if (result == tabsText[2]) {
          widget.tabController.animateTo(2);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: tabsText[0],
          child: Text(tabsText[0]),
        ),
        PopupMenuItem<String>(
          value: tabsText[1],
          child: Text(tabsText[1]),
        ),
        PopupMenuItem<String>(
          value: tabsText[2],
          child: Text(tabsText[2]),
        ),
      ],
    );
  }
}
