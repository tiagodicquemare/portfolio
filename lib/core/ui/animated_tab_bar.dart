import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

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
    return SizedBox(
        height: 52,
        child: Row(
          children: [
            Image.asset(MyAssets.lydiaLogo, height: 40),
            const SizedBox(width: 16),
            Text(
              "Dicquemare Solution",
              style: AppTextStyles.textLSemiBold(color: Colors.white),
            ),
            const Spacer(),
            SizedBox(
              width: widthAppBar,
              child: Stack(
                children: <Widget>[
                  AppBar(
                    backgroundColor: myLightColorScheme.primary,
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
                                  color: Colors.white),
                            )),
                        Tab(
                            height: 50,
                            child: Text(
                              "Projets",
                              style: AppTextStyles.textLSemiBold(
                                  color: Colors.white),
                            )),
                        Tab(
                            height: 50,
                            child: Text(
                              "Contact",
                              style: AppTextStyles.textLSemiBold(
                                  color: Colors.white),
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
                          color: myLightColorScheme.onPrimary.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
