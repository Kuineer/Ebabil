import 'package:flutter/material.dart';

import '../stylesheet.dart';
import '../functions.dart';

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

            },
          ),
          ListTile(
            title: Text('Español'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('Français'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('Italiano'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('Türkçe'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('عربي'),
            onTap: () {

            },
          ),
          ListTile(
            title: Text('日本語'),
            onTap: () {

            },
          )
        ]
      )
    );
  }
}
