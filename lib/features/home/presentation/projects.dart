import 'package:dicquemare_solution/assets.dart';
import 'package:dicquemare_solution/features/home/domain/entities/project.dart';

List<Project> projects = [
  Project(
      assetLogo: MyAssets.lydiaLogo,
      name: "Lydia",
      description: "Une description de mon travail à Lydia",
      startDate: DateTime(2021, 9, 7),
      endDate: DateTime(2022, 9, 7),
      websiteUrl: "https://lydia-app.com",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        Technologie("Android", "https://fr.wikipedia.org/wiki/Android"),
        Technologie("Kotlin", "https://kotlinlang.org/")
      ],
      screenshots: [
        "lydia-screenshots/lydia_screenshot_1.png",
        "lydia-screenshots/lydia_screenshot_2.png",
        "lydia-screenshots/lydia_screenshot_3.png",
        "lydia-screenshots/lydia_screenshot_4.png",
        "lydia-screenshots/lydia_screenshot_5.png"
      ]),
  Project(
      assetLogo: MyAssets.plekoLogo,
      name: "Pleko",
      description: "Une description de mon travail à Pleko",
      startDate: DateTime(2021, 11, 1),
      endDate: DateTime(2023, 10, 15),
      websiteUrl: "https://pleko.fr/",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        Technologie("Android", "https://fr.wikipedia.org/wiki/Android"),
        Technologie("Kotlin", "https://kotlinlang.org/"),
      ],
      screenshots: [
        "pleko-screenshots/pleko_screenshot_1.png",
        "pleko-screenshots/pleko_screenshot_2.png",
        "pleko-screenshots/pleko_screenshot_3.png",
        "pleko-screenshots/pleko_screenshot_4.png",
        "pleko-screenshots/pleko_screenshot_5.png"
      ]),
  Project(
      assetLogo: MyAssets.myJunglyLogo,
      name: "My Jungly",
      description: "Une description de mon travail à My Jungly",
      startDate: DateTime(2023, 1, 15),
      endDate: DateTime(2023, 11, 15),
      websiteUrl: "https://myjungly.com/agence/",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.lydia",
      appStoreUrl:
          "https://apps.apple.com/fr/app/lydia-paiement-mobile/id927139382",
      technologies: [
        Technologie("Android", "https://fr.wikipedia.org/wiki/Android"),
        Technologie("Kotlin", "https://kotlinlang.org/")
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
      ])
];
