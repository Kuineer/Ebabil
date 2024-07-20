import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../functions.dart';
import '../stylesheet.dart';

const Map<String, dynamic> language_names = {
  "en": "English",
  "es": "Español",
  "fr": "Français",
  "it": "Italiano",
  "tr": "Türkçe",
  "ru": "Русский",
  "ar": "عربي",
  "ja": "日本語"
};

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
        backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
        title: Text(AppLocalizations.of(context)!.settings,
          style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
        )
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language + ' (Restart Your App to Apply Changes)',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            subtitle: Text(language_names[Localizations.localeOf(context).toString()],
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, 'language_selection');
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.theme,
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {

              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.notifications,
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {

              },
            ),
          ),
        ],
      ),
    );
  }
}
