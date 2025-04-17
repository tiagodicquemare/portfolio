import 'package:flutter/material.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/testimony.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestimoniesWidget extends StatefulWidget {
  const TestimoniesWidget({super.key});

  @override
  State<TestimoniesWidget> createState() => _TestimoniesWidgetState();
}

class _TestimoniesWidgetState extends State<TestimoniesWidget> {
  final PageController _pageController = PageController(viewportFraction: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testimonies = myTestimonies(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Témoignages',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ce que disent mes clients',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF4A5568),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 500,
            child: PageView.builder(
              itemCount: testimonies.length,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final testimony = testimonies[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CoreUtils.isSmallScreen(context) ? 24 : 160.0,
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 32),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF4F46E5),
                              width: 2,
                            ),
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
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              testimony.message,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4A5568),
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                testimony.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${testimony.profession}, ${testimony.company}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4A5568),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          SmoothPageIndicator(
            controller: _pageController,
            count: testimonies.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              activeDotColor: Color(0xFF4F46E5),
              dotColor: Color(0xFFE5E7EB),
              spacing: 8.0,
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