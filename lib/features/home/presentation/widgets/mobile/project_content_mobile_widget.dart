import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/projects.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/project_content_widgets/project_description_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/swipeable_project_widget.dart';
import 'package:flutter/material.dart';

class ProjectContentMobileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProjectContentMobileState();
}

class ProjectContentMobileState extends State<ProjectContentMobileWidget> {
  List<Project> get projects => projectsList(context);
  int selectedProjectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SwipeableProjectsCarousel(
            projects: projects,
            mobileDesign: true,
            onProjectSelected: (index) {
              setState(() {
                selectedProjectIndex = index;
              });
            },
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ProjectDescriptionWidget(
              project: projects[selectedProjectIndex],
            ),
          ),
        ],
      ),
    );
  }
}
