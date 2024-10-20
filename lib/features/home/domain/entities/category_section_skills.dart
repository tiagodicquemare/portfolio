import 'package:dicquemare_solution/assets.dart';

class CategorySkillsSection {
  String title;
  List<SkillsSection> skillsSection;

  CategorySkillsSection({required this.title, required this.skillsSection});
}

abstract class SkillsSection {}

class SkillsSectionWithOnlyDescription extends SkillsSection {
  String title;
  String description;

  SkillsSectionWithOnlyDescription(
      {required this.title, required this.description});
}

class SkillsSectionWithMultipleItems extends SkillsSection {
  String title;
  String assetPath;
  List<SkillItem> skills;

  SkillsSectionWithMultipleItems(
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
      SkillsSectionWithMultipleItems(
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
      SkillsSectionWithMultipleItems(
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
  CategorySkillsSection(
    title: "Soft Skills",
    skillsSection: [
      SkillsSectionWithOnlyDescription(
          title: "Capacité d'écoute",
          description:
              "Principale compéténce pour travailler efficacement en équipe. Permet de mieux comprendre les besoins de l'entreprise et d'y apporter des solutions optimales pour son développement"),
      SkillsSectionWithOnlyDescription(
          title: "Analyse de besoin",
          description:
              "Recueillir les besoins fonctionnelles ou uitlisateurs. Les organiser et les catégoriser pour les prioriser en niveau d'importance. Permet de rapidement avoir de la valeur ajouté pour l'entreprise"),
      SkillsSectionWithOnlyDescription(
          title: "Autonomie et flexible",
          description:
              "Me permet de prendre des décisions rapides et efficaces avec la confiance de la plus-value de l'entreprise sans forcément avoir à perdre du temps dans des processus de validation avec les différents membres de l'équipe"),
    ],
  ),
  CategorySkillsSection(
      title: "Entrepreneuriat  et Associatif",
      skillsSection: [
        SkillsSectionWithOnlyDescription(
            title: "Pleko",
            description:
                "Avec des connaissances des études nous avons créer une entreprise de ménage qui engager des jeunes pour réaliser les prestations. L'entreprise fût développer en deux avec un site web et une application mobile. Nous avons développer un réseau de plus de 50 clients quotidien."),
        SkillsSectionWithOnlyDescription(
            title: "Junior Miage Concept Président / Vice-Trésorier",
            description:
                "Au cours de mes années de Master j'ai eu l'opportunité de participer dans l'équipe associative de la Junior Entreprise de mes études. Dans ma première années j'ai pu apprendre plusieurs aspect de la trésorerie d'une entreprise en tant que vice-trésorier. J'ai pu développer mon sens des responsabilités et mes connaissances dans la trésorerie et la comptabilité. Dans ma deuxième année je fut président de l'association et durant le mandat avec notre équipe nous avons pu obtenir le label Junior Entreprise décerner par la CNJE.")
      ])
];
