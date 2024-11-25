import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:flutter/material.dart';

class AnimatedTabBar extends StatefulWidget {
  final double width;
  final TabController tabController;
  final List<String> tabsText;

  const AnimatedTabBar(
      {Key? key,
      required this.width,
      required this.tabController,
      required this.tabsText})
      : super(key: key);

  @override
  AnimatedTabBarState createState() => AnimatedTabBarState();
}

class AnimatedTabBarState extends State<AnimatedTabBar>
    with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        children: [
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
                      widget.tabsText[0],
                      style: tabTextStyle(context),
                    )),
                Tab(
                    height: 50,
                    child: Text(
                      widget.tabsText[1],
                      style: tabTextStyle(context),
                    )),
                Tab(
                    height: 50,
                    child: Text(
                      widget.tabsText[2],
                      style: tabTextStyle(context),
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            left: (widget.width / 3) * widget.tabController.animation!.value,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: (widget.width / 3) - 8,
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
    );
  }

  TextStyle tabTextStyle(BuildContext context) {
    return CoreUtils.isSmallScreen(context)
        ? AppTextStyles.textSSemiBold(color: myLightColorScheme.primary)
        : AppTextStyles.textLSemiBold(color: myLightColorScheme.primary);
  }
}
