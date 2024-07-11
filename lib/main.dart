import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configurations/dart_maps/stylesheet.dart';
import 'configurations/functions.dart';

import 'pages/accomodation.dart';
import 'pages/catering.dart';
import 'pages/language_selection.dart';
import 'pages/settings.dart';
import 'pages/tourist_attractions.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  const Root({ Key ? key }) : super(key: key);

  @override
  void initState() {
    final Future<bool> is_initialized = IsInitialized();

    if (is_initialized == false) {
      GenerateDefaultPreferences();
    } else {
      SynchronizeDLIfSet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebabil',
      localizationsDelegates: [
        //AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
        Locale('it', 'IT'),
        Locale('tr', 'TR'),
        Locale('ar', 'SA'),
        Locale('ja', 'JP')
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(),
      routes: {
        'accomodation': (context) => Accomodation(),
        'catering': (context) => Catering(),
        'language_selection': (context) => LanguageSelection(),
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
            backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
            appBar: AppBar(
              backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
              title: Text('Ebabil',
                style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: StylesheetColor(stylesheet['AppBar']['actions']['icon']['color'])
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
                  HomeButton("112'Yİ ARA (Sadece acil durumlar)", Icons.call, CallNumber('112')),
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

  Widget HomeButton(String label, IconData icon, Future<Object?> code) {
    return ElevatedButton(
      onPressed: () {
        code;
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: stylesheet['HomeButton']['SizedBox']['width']),
          Text(label)
        ]
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
              SizedBox(width: stylesheet['HomeButton']['SizedBox']['width']),
              Text(label)
            ]
        )
    );
  }
}
