import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
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
              HomePageButton('Turistik yerler', Icons.location_on)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Hizmetler'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.place),
                label: 'Yerler'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),
                label: 'Ulaşım'
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {

            });
          },
          child: Icon(Icons.call),
          backgroundColor: Colors.red
        ),
      ),
    );
  }

  Widget HomePageButton(String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        CallNumber('112');
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Text(label)
        ],
      ),
    );
  }
}