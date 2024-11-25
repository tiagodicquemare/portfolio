import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/ui/my_tab_bar.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/about_me_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/my_chronology_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_widgets/testimony_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/mobile/about_me_mobile_widget.dart';
import 'package:flutter/material.dart';

class CourseContentMobileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseContentMobileState();
}

class CourseContentMobileState extends State<CourseContentMobileWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _childrenViews = [
    AboutMeMobileWidget(),
    MyChronologyWidget(),
    TestimonyWidget()
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        SizedBox(
            height: MY_TAB_BAR_HEIGHT,
            child: AnimatedTabBar(
                width: MediaQuery.sizeOf(context).width * 0.9,
                tabsText: const ["En résumé", "Mon parcours", "Témoignages"],
                tabController: _tabController)),
        Expanded(child: _childrenViews[_tabController.index])
      ],
    );
  }
}
