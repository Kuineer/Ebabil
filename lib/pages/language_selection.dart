import 'package:flutter/material.dart';

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
            title: Text('English',
              style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('en', 'US');
            }
          ),
          ListTile(
            title: Text('Español',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('es', 'SP');
            }
          ),
          ListTile(
            title: Text('Français',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('fr', 'FR');
            }
          ),
          ListTile(
            title: Text('Italiano',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('it', 'IT');
            }
          ),
          ListTile(
            title: Text('Türkçe',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('tr', 'TR');
            }
          ),
          ListTile(
            title: Text('عربي',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('ar', 'SA');
            }
          ),
          ListTile(
            title: Text('日本語',
                style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            onTap: () {
              SetLocale('ja', 'JP');
            }
          )
        ]
      )
    );
  }
}
