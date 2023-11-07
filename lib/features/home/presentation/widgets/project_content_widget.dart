import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/bloc/home_bloc.dart';
import 'package:dicquemare_solution/features/home/presentation/projects.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/swipeable_project_widget.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightPhone = CoreUtils.getPhoneScreenHeight(context);
    widthPhone = CoreUtils.getPhoneScreenWidth(context);
    final widthContent =
        (MediaQuery.of(context).size.width / 2) - widthPhone / 2;
    /*BlocProvider.of<PhoneContainerBloc>(context)
        .add(ScreenshotChosenEvent(projects[selectedProjectIndex].screenshots));*/
    return Container(
      color: Colors.yellow,
      child: Stack(
        children: [
          Positioned(
              left: widthContent - widthPhone / 1.33,
              bottom: 10,
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
              width: widthContent,
              child: ProjectContentFirstPartWidget(
                project: projects[selectedProjectIndex],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: widthContent,
              child: ProjectContentSecondPartWidget(
                project: projects[selectedProjectIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContentFirstPartWidget extends StatefulWidget {
  final Project project;
  const ProjectContentFirstPartWidget({super.key, required this.project});
  @override
  State<StatefulWidget> createState() => _ProjectContenFirsttWidgetState();
}

class _ProjectContenFirsttWidgetState
    extends State<ProjectContentFirstPartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(widget.project.assetLogo),
            height: 48,
          ),
          const SizedBox(height: 16),
          widget.project.websiteUrl != null
              ? InkWell(
                  onTap: () {
                    if (widget.project.websiteUrl != null) {
                      launchUrl(Uri.parse(widget.project.websiteUrl!));
                    }
                  },
                  child: const Text(
                    "Site web",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 24),
          Text(widget.project.description)
        ],
      ),
    );
  }
}

class ProjectContentSecondPartWidget extends StatefulWidget {
  final Project project;
  const ProjectContentSecondPartWidget({super.key, required this.project});
  @override
  State<StatefulWidget> createState() => _ProjectContentSecondWidgetState();
}

class _ProjectContentSecondWidgetState
    extends State<ProjectContentSecondPartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.project.playStoreUrl != null &&
                  widget.project.appStoreUrl != null
              ? buttonsPlaystoreAppStore()
              : const SizedBox(),
          const SizedBox(height: 32),
          const Text("Technologies utilisées :"),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.project.technologies
                .map((tech) => ActionChip(
                      label: Text('#${tech.name}'),
                      onPressed: () => _launchURL(tech.url),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buttonsPlaystoreAppStore() {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.0, // Space between the buttons horizontally
      runSpacing: 8.0, // Space between the buttons vertically when wrapping
      children: [
        InkWell(
          onTap: () {
            if (widget.project.playStoreUrl != null) {
              _launchURL(widget.project.playStoreUrl!);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min, // To wrap the content
                children: [
                  Image(
                    image: AssetImage(MyAssets.playstoreLogo),
                    height: 48,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Disponible sur \nPlaystore",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (widget.project.appStoreUrl != null) {
              _launchURL(widget.project.appStoreUrl!);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min, // To wrap the content
                children: [
                  Image(
                    image: AssetImage(MyAssets.appleLogo),
                    height: 48,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Disponible sur \nl'App Store",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
