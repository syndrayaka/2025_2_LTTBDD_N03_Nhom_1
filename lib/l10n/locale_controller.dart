import 'package:flutter/material.dart';

class LocaleController {
  LocaleController._();

  static final ValueNotifier<Locale?> localeNotifier =
      ValueNotifier<Locale?>(null);

  static void setLocale(Locale? locale) {
    localeNotifier.value = locale;
  }

  static void toggleBetweenEnglishAndVietnamese(BuildContext context) {
    final languageCode = localeNotifier.value?.languageCode ??
        Localizations.localeOf(context).languageCode;
    setLocale(Locale(languageCode == 'vi' ? 'en' : 'vi'));
  }
}
