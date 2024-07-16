import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';
import 'stylesheet.dart';

import 'pages/accomodation.dart';
import 'pages/catering.dart';
import 'pages/language_selection.dart';
import 'pages/settings.dart';
import 'pages/tourist_attractions.dart';

dynamic language, country_code;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((sp) {
    language = sp.getString('language');
    country_code = sp.getString('locale_region');
  });

  runApp(Root());
}

class Root extends StatefulWidget {
  const Root({ Key ? key }) : super(key: key);

  @override
  State<Root> createState() => RootState();
}

class RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    final Future<bool> is_initialized = IsInitialized();

    is_initialized.then((value) {
      if (!value) {
        GenerateDefaultPreferences();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageSelection()));
        });
      } else {
        SynchronizeDLIfSet();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebabil',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
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
        locale: Locale(language, country_code),
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
            )
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
      ),
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
