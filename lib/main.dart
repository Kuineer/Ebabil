import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';
import 'stylesheet.dart';
import 'widgets.dart';

import 'pages/language_selection.dart';
import 'pages/accomodation.dart';
import 'pages/catering.dart';
import 'pages/tourist_attractions.dart';
import 'pages/transportation.dart';
import 'pages/settings.dart';


dynamic language, country_code;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((sp) {
    language = sp.getString('language');
    country_code = sp.getString('locale_region');
  });

  runApp(
    MaterialApp(
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
        'language_selection': (context) => LanguageSelection(),
        'accomodation': (context) => Accomodation(),
        'catering': (context) => Catering(),
        'tourist_attractions': (context) => TouristAttractions(),
        'transportation': (context) => Transportation(),
        'settings': (context) => Settings()
      }
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final Future<bool> is_initialized = IsInitialized();

    is_initialized.then((value) {
      if (value == false) {
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
              /*appBar: AppBar(
                backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
                title: Text('Ebabil',
                  style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
                )
              ),*/

              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeButton(AppLocalizations.of(context)!.call_emergency_services, Icons.call, CallNumber('112')),
                    NavigationButton(AppLocalizations.of(context)!.catering, Icons.restaurant, 'catering', context),
                    NavigationButton(AppLocalizations.of(context)!.currency_exchange_offices, Icons.currency_exchange, 'settings', context),
                    NavigationButton(AppLocalizations.of(context)!.tourist_attractions, Icons.location_on, 'tourist_attractions', context),
                    NavigationButton(AppLocalizations.of(context)!.accomodation, Icons.bungalow, 'accomodation', context),
                    NavigationButton(AppLocalizations.of(context)!.transportation, Icons.directions_bus, 'transportation', context),
                    NavigationButton(AppLocalizations.of(context)!.the_map, Icons.map, 'settings', context),
                    NavigationButton(AppLocalizations.of(context)!.settings, Icons.settings, 'settings', context)
                  ]
                )
              )
            )
        )
    );
  }
}
