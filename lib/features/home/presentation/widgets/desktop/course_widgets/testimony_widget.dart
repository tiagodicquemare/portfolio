import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/features/home/domain/entities/testimony.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestimonyWidget extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final testimonies = myTestimonies(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.6,
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: PageView.builder(
              itemCount: testimonies.length,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final testimony = testimonies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              testimony.assetPhoto,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            testimony.message,
                            style: const TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          testimony.name,
                          style: AppTextStyles.textMRegular(
                              color: myLightColorScheme.primary),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          '${testimony.profession}, ${testimony.company}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 48.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: testimonies.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              activeDotColor: Colors.blueAccent,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
