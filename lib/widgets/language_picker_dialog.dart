import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/locale_controller.dart';

Future<void> showLanguagePickerDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);

  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(l10n.languageDialogTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Text('EN'),
              title: Text(l10n.languageEnglish),
              onTap: () {
                LocaleController.setLocale(const Locale('en'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Text('VI'),
              title: Text(l10n.languageVietnamese),
              onTap: () {
                LocaleController.setLocale(const Locale('vi'));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}


