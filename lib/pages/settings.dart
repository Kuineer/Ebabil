import 'package:flutter/material.dart';

import '../configurations/dart_maps/stylesheet.dart';
import '../configurations/functions.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
          backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
          title: Text('Settings',
              style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
          )
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dil'),
            subtitle: Text('Türkçe'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, 'language_selection');
            },
          ),
          ListTile(
            title: Text('Tema'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {

              },
            ),
          ),
          ListTile(
            title: Text('Bildirimler'),
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
