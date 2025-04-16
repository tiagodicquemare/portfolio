import 'package:flutter/material.dart';
import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/ui/text_styles.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/domain/entities/testimony.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({super.key});

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  final PageController _pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    final testimonies = myTestimonies(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 48, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Développeur Mobile Expert',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748), // dark gray
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'De l\'idée au store, je concrétise votre application mobile',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF4A5568), // medium gray
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 48),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(MyAssets.profilePhoto),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Services Section
                _buildSection(
                  title: 'Développement & Maintenance',
                  services: [
                    ServiceCard(
                      icon: Icons.phone_android,
                      title: 'Android Natif',
                      description: 'Apps performantes en Kotlin/Java pour une expérience utilisateur optimale.',
                    ),
                    ServiceCard(
                      icon: Icons.code,
                      title: 'Apps Hybrides',
                      description: 'Solutions Flutter multi-plateformes pour iOS et Android.',
                    ),
                    ServiceCard(
                      icon: Icons.psychology,
                      title: 'Legacy',
                      description: 'Modernisation et optimisation de votre code existant.',
                    ),
                    ServiceCard(
                      icon: Icons.storage,
                      title: 'Architecture',
                      description: 'Clean Architecture pour des apps évolutives et maintenables.',
                    ),
                    ServiceCard(
                      icon: Icons.rocket_launch,
                      title: 'CI/CD',
                      description: 'Déploiement automatisé via Jenkins ou GitHub Actions.',
                    ),
                    ServiceCard(
                      icon: Icons.bar_chart,
                      title: 'Publication',
                      description: 'Gestion complète du processus de publication sur les stores.',
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // MVP Section
                _buildSection(
                  title: 'MVP Mobile',
                  services: [
                    ServiceCard(
                      icon: Icons.psychology,
                      title: 'Conseil Tech',
                      description: 'Choix technologiques adaptés à votre vision et budget.',
                    ),
                    ServiceCard(
                      icon: Icons.palette,
                      title: 'UX/UI',
                      description: 'Design intuitif et éco-conçu pour votre app.',
                    ),
                    ServiceCard(
                      icon: Icons.code,
                      title: 'Code Évolutif',
                      description: 'Base technique solide pour vos futures évolutions.',
                    ),
                    ServiceCard(
                      icon: Icons.storage,
                      title: 'Backend',
                      description: 'Infrastructure cloud adaptée à votre croissance.',
                    ),
                    ServiceCard(
                      icon: Icons.psychology,
                      title: 'IA',
                      description: 'Intégration intelligente de solutions IA innovantes.',
                    ),
                    ServiceCard(
                      icon: Icons.bar_chart,
                      title: 'Analytics',
                      description: 'Suivi précis pour optimiser votre ROI.',
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // Testimonies Section
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Témoignages',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 48),
                      Container(
                        height: 400,
                        child: PageView.builder(
                          itemCount: testimonies.length,
                          controller: _pageController,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final testimony = testimonies[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: CoreUtils.isSmallScreen(context) ? 24 : 160.0),
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
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),
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
                ),

                // CTA Section
                Container(
                  padding: const EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F46E5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Lancez Votre Projet Mobile',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Transformons votre idée en application performante',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFC7D2FE),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF4F46E5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Contactez-moi'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildSection({
    required String title,
    required List<ServiceCard> services,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: services.map((service) {
                return Flexible(
                  flex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth > 1024
                          ? (constraints.maxWidth - 48) / 3
                          : constraints.maxWidth > 768
                              ? (constraints.maxWidth - 24) / 2
                              : constraints.maxWidth,
                    ),
                    child: service,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: const Color(0xFF4F46E5),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: const TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
