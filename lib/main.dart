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
              HomePageButton('112''Yİ ARA (Sadece acil durumlar)', Icons.phone, 1),
              HomePageButton('Yeme & İçme', Icons.restaurant, 2),
              HomePageButton('Döviz Büroları', Icons.attach_money, 3),
              HomePageButton('Turistik yerler', Icons.location_on, 4),
              HomePageButton('Konaklama', Icons.bungalow, 5),
              HomePageButton('Ulaşım', Icons.directions_bus, 6),
              HomePageButton('Harita', Icons.map, 7),
              HomePageButton('Ayarlar', Icons.settings, 8)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.call),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            });
          },
        ),
      ),
    );
  }

  Widget HomePageButton(String label, IconData icon, int id) {
    return ElevatedButton(
      onPressed: () {

      },
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(label)
        ],
      ),
    );
  }
}
