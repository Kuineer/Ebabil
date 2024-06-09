import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'functions.dart';
import 'language_selection.dart';

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
      title: 'Ebabil',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
        const Locale('fr'),
        const Locale('tr'),
        const Locale('ar'),
        const Locale('ja')
      ],
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Ebabil'),
          actions: [
            IconButton(
              icon: const Icon(Icons.remove_red_eye),
              onPressed: () {

              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomePageButton(AppLocalizations.of(context)!.menu.catering, Icons.restaurant),
              HomePageButton(AppLocalizations.of(context)!.menu.currency_exchange_offices, Icons.currency_exchange),
              HomePageButton(AppLocalizations.of(context)!.menu.tourist_attractions, Icons.location_on)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.map),
                label: AppLocalizations.of(context)!.footer_buttons.open_the_map
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.place),
                label: AppLocalizations.of(context)!.footer_buttons.places
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.directions_bus),
                label: AppLocalizations.of(context)!.footer_buttons.transportation
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              CallNumber('112');
            });
          },
          child: const Icon(Icons.call),
          backgroundColor: Colors.red
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
          Text(label)
        ],
      ),
    );
  }
}