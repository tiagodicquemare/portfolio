import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:flutter/material.dart';

Map<String, Technologie> mapOfTechnologies = {
  "Android": Technologie(
      "Android",
      "Android est un système d'exploitation mobile fondé sur le noyau Linux et développé par Google.",
      "https://fr.wikipedia.org/wiki/Android"),
  "Kotlin": Technologie(
      "Kotlin",
      "Kotlin est un langage de programmation orienté objet et fonctionnel, multiplateforme, concis et sûr de type statique développé par JetBrains en 2011 qui compile pour la machine virtuelle Java et qui peut aussi compiler vers le code source JavaScript ou LLVM.",
      "https://kotlinlang.org/"),
  "Flutter": Technologie(
      "Flutter",
      "Flutter est un kit de développement de logiciels d'interface utilisateur open-source créé par Google. Il est utilisé pour développer des applications pour Android, iOS, Linux, Mac, Windows, Google Fuchsia et le Web à partir d'une seule base de code.",
      "https://flutter.dev/"),
  "Dart": Technologie(
      "Dart",
      "Dart est un langage de programmation orienté objet développé par Google. Il est utilisé pour le développement d'applications mobiles, de serveurs et de sites web. Il est open source et multiplateforme.",
      "https://dart.dev/"),
  "UI/UX Design": Technologie(
      "UI/UX Design",
      "Android est un système d'exploitation mobile fondé sur le noyau Linux et développé par Google.",
      "https://www.figma.com/"),
  "Management": Technologie(
      "Management",
      "Android est un système d'exploitation mobile fondé sur le noyau Linux et développé par Google.",
      "https://www.figma.com/"),
};

List<Project> projectsList(BuildContext context) {
  return [
    Project(
      assetLogo: MyAssets.lydiaLogo,
      name: "Lydia Solutions",
      description: "",
      startDate: DateTime(2021, 9, 7),
      endDate: DateTime(2022, 9, 7),
      websiteUrl: "https://lydia-app.com",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        mapOfTechnologies["Android"]!,
        mapOfTechnologies["Kotlin"]!,
        mapOfTechnologies["Flutter"]!,
        mapOfTechnologies["Dart"]!,
      ],
      screenshots: [
        "lydia-screenshots/lydia_screenshot_1.png",
        "lydia-screenshots/lydia_screenshot_2.png",
        "lydia-screenshots/lydia_screenshot_3.png",
        "lydia-screenshots/lydia_screenshot_4.png",
        "lydia-screenshots/lydia_screenshot_5.png"
      ],
    ),
    Project(
      assetLogo: MyAssets.plekoLogo,
      name: "Pleko",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur egestas sem sit amet massa bibendum, at consequat nisl gravida. Nulla sed mollis velit. Fusce interdum interdum mi, at vehicula mauris porta sed.",
      startDate: DateTime(2021, 11, 1),
      endDate: DateTime(2023, 10, 15),
      websiteUrl: "https://pleko.fr/",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        mapOfTechnologies["Android"]!,
        mapOfTechnologies["Kotlin"]!,
        mapOfTechnologies["Flutter"]!,
        mapOfTechnologies["Dart"]!,
      ],
      screenshots: [
        "pleko-screenshots/pleko_screenshot_1.png",
        "pleko-screenshots/pleko_screenshot_2.png",
        "pleko-screenshots/pleko_screenshot_3.png",
        "pleko-screenshots/pleko_screenshot_4.png",
        "pleko-screenshots/pleko_screenshot_5.png"
      ],
    ),
    Project(
      assetLogo: MyAssets.myJunglyLogo,
      name: "My Jungly",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur egestas sem sit amet massa bibendum, at consequat nisl gravida. Nulla sed mollis velit. Fusce interdum interdum mi, at vehicula mauris porta sed.",
      startDate: DateTime(2023, 1, 15),
      endDate: DateTime(2023, 11, 15),
      websiteUrl: "https://myjungly.com/agence/",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        mapOfTechnologies["Android"]!,
        mapOfTechnologies["Kotlin"]!,
        mapOfTechnologies["Flutter"]!,
        mapOfTechnologies["Dart"]!,
      ],
      screenshots: [
        "delupay-screenshots/delupay_screenshot_1.png",
        "delupay-screenshots/delupay_screenshot_2.png",
        "delupay-screenshots/delupay_screenshot_3.png",
        "delupay-screenshots/delupay_screenshot_4.png",
        "delupay-screenshots/delupay_screenshot_5.png",
        "delupay-screenshots/delupay_screenshot_6.png",
        "delupay-screenshots/delupay_screenshot_7.png",
        "delupay-screenshots/delupay_screenshot_8.png",
        "delupay-screenshots/delupay_screenshot_9.png"
      ],
    ),
  ];
}
