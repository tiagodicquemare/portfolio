import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/bloc/home_bloc.dart';
import 'package:dicquemare_solution/features/home/presentation/projects.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/project_content_widgets/project_description_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/swipeable_project_widget.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/pages/smart_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';

class ProjectContentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectContentWidgetState();
}

class _ProjectContentWidgetState extends State<ProjectContentWidget> {
  double heightPhone = 600;
  double widthPhone = 350;
  int selectedProjectIndex = 0;
  bool firstInit = true;
  List<Project> get projects => projectsList(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightPhone = CoreUtils.getPhoneScreenHeight(context);
    widthPhone = CoreUtils.getPhoneScreenWidth(context);
    final widthFirstPartContent =
        (MediaQuery.of(context).size.width) - widthPhone * 3 - 32;
    return Container(
      child: Stack(
        children: [
          Positioned(
              left: widthFirstPartContent,
              top: (MediaQuery.sizeOf(context).height -
                      heightPhone -
                      MY_TAB_BAR_HEIGHT) /
                  2,
              bottom: (MediaQuery.sizeOf(context).height -
                      heightPhone -
                      MY_TAB_BAR_HEIGHT) /
                  2,
              child: SwipeableProjectsCarousel(
                projects: projects,
                onProjectSelected: (index) {
                  setState(() {
                    selectedProjectIndex = index;
                  });
                },
              )),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: widthFirstPartContent,
              child: ProjectDescriptionWidget(
                project: projects[selectedProjectIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
