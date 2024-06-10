import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';

import 'language_selection.dart';
import 'settings.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _current_tab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Ebabil'),
          actions: [
            IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {

              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomePageButton('Yeme & İçme', Icons.restaurant),
              HomePageButton('Döviz Büroları', Icons.attach_money),
              HomePageButton('Turistik yerler', Icons.location_on),
              HomePageButton('Konaklama', Icons.bungalow),
              HomePageButton('Ulaşım', Icons.directions_bus),
              HomePageButton('Harita', Icons.map),
              HomePageButton('Ayarlar', Icons.settings) 
              // listedeki elementler
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[900],
          child: Icon(Icons.call),
          onPressed: () {
            setState(() {
              CallNumber('112'); // 112 yi arama butonu
            });
          }
        ),
      ),
    );
  }

  Widget HomePageButton(String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {

      },
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(label) //ana sayfa butonu
        ],
      ),
    );
  }
}
