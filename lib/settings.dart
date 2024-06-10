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
              // dil seçeneği
            },
          ),
          ListTile(
            title: Text('Tema'),
            trailing: Switch(
              value: true, // dark mode/ light mode seçeneği varsayılan lilght
              onChanged: (bool value) {
                // dark mode/light mode
              },
            ),
          ),
          ListTile(
            title: Text('Bildirimler'),
            trailing: Switch(
              value: false, // bildirimler ayarı varsayılan kapalı
              onChanged: (bool value) {
                // bildirim ayarları
              },
            ),
          ),
          // yeni ayarlar eklenmesi için işaret
        ],
      ),
    );
  }
}
