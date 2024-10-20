import 'package:dicquemare_solution/assets.dart';

class CategorySkillsSection {
  String title;
  List<SkillsSection> skillsSection;

  CategorySkillsSection({required this.title, required this.skillsSection});
}

class SkillsSection {
  String title;
  String assetPath;
  List<SkillItem> skills;

  SkillsSection(
      {required this.title, required this.assetPath, required this.skills});
}

class SkillItem {
  String title;
  String description;

  SkillItem({
    required this.title,
    required this.description,
  });
}

List<CategorySkillsSection> mySkillsCategories = [
  CategorySkillsSection(
    title: "Compétence technique",
    skillsSection: [
      SkillsSection(
        title: "Développement Android",
        assetPath: MyAssets.icMail,
        skills: [
          SkillItem(
            title: "Java / Kotlin",
            description:
                "Principaux langages de programmation pour le développement Android",
          ),
          SkillItem(
            title: "Jetpack Compose",
            description: "Création d'UI déclarative créer pour Android",
          ),
          SkillItem(
            title: "Hilt",
            description: "Injection de dépendance",
          )
        ],
      ),
      SkillsSection(
        title: "Développement Flutter",
        assetPath: MyAssets.icMail,
        skills: [
          SkillItem(
              title: "Get It",
              description:
                  "Ma libraire principale pour l'injection de dépendance sur Flutter"),
          SkillItem(
              title: "Bloc",
              description:
                  "Librairie pour organiser et faciliter la gestion du state Flutter")
        ],
      )
    ],
  ),
  // CategorySkillsSection(title: "Soft Skills", skillsSection: SkillsSection(title: title, assetPath: assetPath, skills: skills))
];
