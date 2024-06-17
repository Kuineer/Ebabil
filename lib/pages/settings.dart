import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
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
