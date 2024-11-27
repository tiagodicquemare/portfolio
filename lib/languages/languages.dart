import 'package:dicquemare_solution/languages/languages_en.dart';
import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages) ?? LanguagesEn();
  }

  // Tab bar Titles
  String get tabBarMyJourney;
  String get tabBarProjects;
  String get tabBarContact;

  // Contact me widget
  String get contactMeTitle;
  String get contactMeDescription;
  String get contactMeHintEmail;
  String get contactMeHintName;
  String get contactMeHintBody;
  String get contactMeHintErrorEmail;
  String get contactMeHintSendButton;
  String get contactSendEmailSuccess;
  String get contactSendEmailError;
  String contactFollowMeOn(String socialMedia);

  // About me widget
  String get aboutMeTitle;
  String get aboutMePost;
  String get aboutMeDescription;
  String get aboutMeFirstPointTitle;
  String get aboutMeFirstPointDescription;
  String get aboutMeSecondPointTitle;
  String get aboutMeSecondPointDescription;
  String get aboutMeThirdPointTitle;
  String get aboutMeThirdPointDescription;
  String get aboutMeFourthPointTitle;
  String get aboutMeFourthPointDescription;
  String get aboutMeTabBarMe;
  String get aboutMeTabBarChronology;
  String get aboutMeTabBarTestimony;
  String get aboutMePhoneWelcome;
  String get aboutMePhoneDescription;

  // Chronology widget
  String get chronologyTitle;
  String get chronologyLydia2024Post;
  String get chronologyLydia2024Description;
  String get chronologyMyJungly2023Post;
  String get chronologyMyJungly2023Description;
  String get chronologyPleko2021Post;
  String get chronologyPleko2021Description;
  String get chronologyLydia2021Post;
  String get chronologyLydia2021Description;
  String get chronologyFreshDev2020Post;
  String get chronologyFreshDev2020Description;
  String get chronologyJMC2018Post;
  String get chronologyJMC2018Description;
  String get chronologyFreshDev2018Post;
  String get chronologyFreshDev2018Description;
  String get chronologyFrenchCVButton;
  String get chronologyEnglishCVButton;

  // Project content
  String get projectContentLydia;
  String get projectContentDelupay;
  String get projectContentBeepings;
  String get projectContentPleko;
  String get projectContentEndonora;
  String get projectContentSeeMore;

  // Testimony widget
  String get testimonyMichael;
  String get testimonyRene;
}
