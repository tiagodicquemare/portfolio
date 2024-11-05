import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
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

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    widget.tabController.addListener(() {
      if (widget.tabController.indexIsChanging) {
        animation = Tween<double>(
          begin: animation.value,
          end: widget.tabController.index.toDouble(),
        ).animate(animationController);
        animationController.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
              SizedBox(
                width: widthAppBar,
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      bottom: TabBar(
                        controller: widget.tabController,
                        indicatorColor: Colors.transparent,
                        indicator: null,
                        tabs: [
                          Tab(
                              height: 50,
                              child: Text(
                                "Parcours",
                                style: AppTextStyles.textLSemiBold(
                                    color: myLightColorScheme.primary),
                              )),
                          Tab(
                              height: 50,
                              child: Text(
                                "Projets",
                                style: AppTextStyles.textLSemiBold(
                                    color: myLightColorScheme.primary),
                              )),
                          Tab(
                              height: 50,
                              child: Text(
                                "Contact",
                                style: AppTextStyles.textLSemiBold(
                                    color: myLightColorScheme.primary),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: (widthAppBar / 3) * animation.value,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: (widthAppBar / 3) - 8,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: myLightColorScheme.primary.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
