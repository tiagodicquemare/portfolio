import 'package:flutter/material.dart';

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

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
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