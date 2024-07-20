import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../functions.dart';
import '../stylesheet.dart';

class Restaurant {
  final String name;
  final String description;

  Restaurant({required this.name, required this.description});
}

class Catering extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(name: 'Leziz Tavuk', description: 'Ucuz tavuk restoranı'),
    Restaurant(name: 'Pizza Şatosu', description: 'Şehrin merkezinde bir sınırsız pizzacı')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
        backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
        title: Text(AppLocalizations.of(context)!.catering,
          style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
        )
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final item = restaurants[index];
          return ListTile(
            title: Text(item.name,
              style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
            ),
            subtitle: Text(item.description,
              style: TextStyle(color: StylesheetColor(stylesheet['ListTile']['subtitle']['style']['color']))
            )
          );
        },
      ),
    );
  }
}
