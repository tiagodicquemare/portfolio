import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/ui/my_tab_bar.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/about_me_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/my_chronology_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/testimony_widget.dart';
import 'package:flutter/material.dart';

class CourseContentMobileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseContentMobileState();
}

class CourseContentMobileState extends State<CourseContentMobileWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _childrenViews = [
    AboutMeWidget(),
    MyChronologyWidget(),
    TestimonyWidget()
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MY_TAB_BAR_HEIGHT,
            child: AnimatedTabBar(
                width: MediaQuery.sizeOf(context).width * 0.7,
                tabController: _tabController)),
        _childrenViews[_tabController.index]
      ],
    );
  }
}
