import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../stylesheet.dart';
import '../functions.dart';

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
            title: Text(AppLocalizations.of(context)!.language + '(Restart Your App to Apply Changes)'),
            subtitle: Text('Türkçe'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, 'language_selection');
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.theme),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {

              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.notifications),
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
