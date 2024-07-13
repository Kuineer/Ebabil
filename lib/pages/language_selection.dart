import 'package:flutter/material.dart';

import 'package:flutter_close_app/flutter_close_app.dart';

import '../functions.dart';
import '../stylesheet.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
        backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
        title: Text('Choose Your Language',
          style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
        )
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              SetLocale('en', 'US');
            }
          ),
          ListTile(
            title: Text('Español'),
            onTap: () {
              SetLocale('es', 'SP');
            }
          ),
          ListTile(
            title: Text('Français'),
            onTap: () {
              SetLocale('fr', 'FR');
            }
          ),
          ListTile(
            title: Text('Italiano'),
            onTap: () {
              SetLocale('it', 'IT');
            }
          ),
          ListTile(
            title: Text('Türkçe'),
            onTap: () {
              SetLocale('tr', 'TR');
            }
          ),
          ListTile(
            title: Text('عربي'),
            onTap: () {
              SetLocale('ar', 'SA');
            }
          ),
          ListTile(
            title: Text('日本語'),
            onTap: () {
              SetLocale('ja', 'JP');
            }
          )
        ]
      )
    );
  }
}
