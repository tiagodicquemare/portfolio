import 'package:dicquemare_solution/core/carousel/carousel_slider.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/features/home/presentation/bloc/home_bloc.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/pages/smart_phone_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class SwipeableProjectsCarousel extends StatefulWidget {
  List<Project> projects;
  Function(int) onProjectSelected;

  SwipeableProjectsCarousel(
      {required this.projects, required this.onProjectSelected});
  @override
  _SwipeableCardsCarouselState createState() => _SwipeableCardsCarouselState();
}

class _SwipeableCardsCarouselState extends State<SwipeableProjectsCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.4);
  final CarouselController _carouselController = CarouselController();
  int indexPageSelected = 0;

  @override
  Widget build(BuildContext context) {
    final heightPhone = CoreUtils.getPhoneScreenHeight(context);
    final widthPhone = CoreUtils.getPhoneScreenWidth(context);

    List<Widget> listProjectCards = getProjectsWidgets(false);

    return BlocBuilder<PhoneContainerBloc, PhoneContainerState>(
        builder: (context, state) {
      if (state is PhoneAnimationOngoing) {
        listProjectCards = getProjectsWidgets(true);
      } else {
        listProjectCards = getProjectsWidgets(false);
      }
      return SizedBox(
        width: widthPhone * 2 + widthPhone / 2,
        child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                autoPlay: false,
                height: heightPhone,
                enlargeCenterPage: true,
                viewportFraction: 0.4,
                enlargeFactor: 0.7,
                onPageChanged: (index, reason) {
                  widget.onProjectSelected(index);
                  setState(() {
                    indexPageSelected = index;
                  });
                },
                enableInfiniteScroll: false),
            items: listProjectCards),
      );
    });
  }

  List<Widget> getProjectsWidgets(bool animationOngoing) {
    if (animationOngoing) {
      bool first = true;
      return widget.projects.map((project) {
        if (first) {
          first = false;
          return const SizedBox();
        }
        return SmartphoneWidget(
          project: project,
        );
      }).toList();
    } else {
      return widget.projects.asMap().entries.map((entry) {
        int index = entry.key;
        var project = entry.value;
        return GestureDetector(
            onTap: () {
              _carouselController.animateToPage(index);
            },
            child: SmartphoneWidget(
              project: project,
              selected: indexPageSelected == index,
            ));
      }).toList();
    }
  }
}
