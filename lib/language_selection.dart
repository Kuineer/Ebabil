import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Language')
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
          ),
        ],
      ),
    );
  }
}