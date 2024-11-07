import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';
import 'package:dicquemare_solution/languages/languages.dart';
import 'package:flutter/material.dart';

Map<String, Technologie> mapOfTechnologies = {
  "Android": Technologie("Android", "https://fr.wikipedia.org/wiki/Android"),
  "Kotlin": Technologie("Kotlin", "https://kotlinlang.org/"),
  "Clean Architecture": Technologie(
      "Clean Architecture", "https://developer.android.com/topic/architecture"),
  "Dagger/Hilt": Technologie("Dagger/Hilt",
      "https://developer.android.com/training/dependency-injection/hilt-android?hl=fr"),
  "Jetpack Compose":
      Technologie("Jetpack Compose", "https://developer.android.com/compose"),
  "Coroutines": Technologie(
      "Coroutines", "https://developer.android.com/kotlin/coroutines?hl=fr"),
  "JUnit": Technologie("JUnit",
      "https://developer.android.com/training/testing/instrumented-tests/androidx-test-libraries/runner?hl=fr"),
  "NFC": Technologie(
      "NFC", "https://fr.wikipedia.org/wiki/Near-field_communication"),
  "QR Code": Technologie("QR Code", "https://fr.wikipedia.org/wiki/Code_QR"),
  "Flutter/Dart": Technologie("Flutter", "https://flutter.dev/"),
  "Mapbox": Technologie("Mapbox", "https://www.mapbox.com/"),
  "Bloc/Cubit":
      Technologie("Bloc/Cubit", "https://bloclibrary.dev/fr/bloc-concepts/"),
  "Node.js": Technologie("Node.js", "https://nodejs.org/en"),
  "TypeScript": Technologie("TypeScript", "https://www.typescriptlang.org/"),
  "GraphQL": Technologie("GraphQL", "https://graphql.org/"),
  "UI/UX Design": Technologie("UI/UX Design", "https://www.figma.com/"),
  "Management":
      Technologie("Management", "https://fr.wikipedia.org/wiki/Management"),
};

List<Project> projectsList(BuildContext context) {
  return [
    Project(
      assetLogo: MyAssets.lydiaLogo,
      name: "Lydia Solutions",
      description: Languages.of(context).projectContentLydia,
      startDate: DateTime(2021, 9, 7),
      endDate: DateTime(2022, 9, 7),
      websiteUrl: "https://lydia-app.com",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        mapOfTechnologies["Android"]!,
        mapOfTechnologies["Kotlin"]!,
        mapOfTechnologies["Clean Architecture"]!,
        mapOfTechnologies["Dagger/Hilt"]!,
        mapOfTechnologies["Jetpack Compose"]!,
        mapOfTechnologies["Coroutines"]!,
        mapOfTechnologies["JUnit"]!,
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
      description: Languages.of(context).projectContentPleko,
      startDate: DateTime(2021, 11, 1),
      endDate: DateTime(2023, 10, 15),
      technologies: [
        mapOfTechnologies["Flutter/Dart"]!,
        mapOfTechnologies["Bloc/Cubit"]!,
        mapOfTechnologies["Mapbox"]!,
        mapOfTechnologies["Node.js"]!,
        mapOfTechnologies["TypeScript"]!,
        mapOfTechnologies["GraphQL"]!,
        mapOfTechnologies["UI/UX Design"]!,
        mapOfTechnologies["Management"]!,
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
      assetLogo: MyAssets.delubacLogo,
      name: "Delupay",
      description: Languages.of(context).projectContentDelupay,
      startDate: DateTime(2023, 1, 15),
      endDate: DateTime(2023, 12, 01),
      websiteUrl: "https://www.delubac.com/",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.app.delupay&hl=fr",
      appStoreUrl:
          "https://apps.apple.com/fr/app/delupay-payer-avec-son-mobile/id6444056310",
      technologies: [
        mapOfTechnologies["Android"]!,
        mapOfTechnologies["Kotlin"]!,
        mapOfTechnologies["Clean Architecture"]!,
        mapOfTechnologies["Dagger/Hilt"]!,
        mapOfTechnologies["Jetpack Compose"]!,
        mapOfTechnologies["Coroutines"]!,
        mapOfTechnologies["QR Code"]!,
        mapOfTechnologies["NFC"]!,
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
