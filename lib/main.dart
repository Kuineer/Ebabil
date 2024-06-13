import 'package:ebabil/main.dart';
import 'package:ebabil/pages/tourist_attractions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';

import 'pages/accomodation.dart';
import 'pages/catering.dart';
import 'pages/language_selection.dart';
import 'pages/settings.dart';

const double button_sized_box_width = 8;

void main() => runApp(Root());

class Root extends StatelessWidget {
  const Root({ Key ? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(),
      routes: {
        'accomodation': (context) => Accomodation(),
        'catering': (context) => Catering(),
        'settings': (context) => Settings(),
        'tourist_attractions': (context) => TouristAttractions()
      }
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Localizations(
        locale: const Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            backgroundColor: Colors.red,

            appBar: AppBar(
                backgroundColor: Colors.lightBlue,
                title: Text('Ebabil',
                    style: TextStyle(color: Colors.white)
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                          Icons.remove_red_eye,
                        color: Colors.white
                      ),
                      onPressed: () {

                      }
                  )
                ]
            ),

            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            CallNumber('112');
                          },
                          child: Row(
                              children: [
                                Icon(Icons.call),
                                const SizedBox(width: button_sized_box_width),
                                Text("112'Yİ ARA (Sadece acil durumlar)")
                              ]
                          )
                      ),

                      NavigationButton('Yeme İçme', Icons.restaurant, 'catering'),
                      NavigationButton('Döviz Büroları', Icons.currency_exchange, 'settings'),
                      NavigationButton('Turistik Yerler', Icons.location_on, 'tourist_attractions'),
                      NavigationButton('Konaklama', Icons.bungalow, 'accomodation'),
                      NavigationButton('Ulaşım', Icons.directions_bus, 'settings'),
                      NavigationButton('Harita', Icons.map, 'settings'),
                      NavigationButton('Ayarlar', Icons.settings, 'settings')
                    ]
                )
            )
        )
      )
    );
  }

  Widget NavigationButton(String label, IconData icon, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: button_sized_box_width),
          Text(label)
        ]
      )
    );
  }
}
