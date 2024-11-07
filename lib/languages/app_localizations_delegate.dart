import 'package:dicquemare_solution/languages/languages.dart';
import 'package:dicquemare_solution/languages/languages_en.dart';
import 'package:dicquemare_solution/languages/languages_fr.dart';
import 'package:flutter/widgets.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fr', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguagesEn();
      case 'fr':
        return LanguagesFr();
      default:
        return LanguagesEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
