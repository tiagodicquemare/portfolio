import 'package:flutter/material.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/landing_widgets/hero_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/landing_widgets/services_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/landing_widgets/testimonies_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/landing_widgets/cta_widget.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeroWidget(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const ServicesWidget(),
                const SizedBox(height: 24),
                const TestimoniesWidget(),
                const SizedBox(height: 24),
                const CTAWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 