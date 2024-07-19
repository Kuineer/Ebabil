import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../functions.dart';
import '../stylesheet.dart';

class Hotel {
  final String name;
  final String description;
  final double price;

  Hotel({required this.name, required this.description, required this.price});
}

class Accomodation extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(name: 'Grand Hotel', description: 'Lüks bir otel', price: 250),
    Hotel(name: 'Sunset Resort', description: 'Deniz kenarında tatil köyü', price: 180),
    Hotel(name: 'Azure Beach Hotel', description: 'Plaj manzaralı', price: 300),
    Hotel(name: 'Ebabil otel', description: 'Tatlı bir pansiyon', price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
          backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
          title: Text(AppLocalizations.of(context)!.accomodation,
              style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
          )
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final item = hotels[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text('\$${item.price.toStringAsFixed(2)}')
          );
        },
      ),
    );
  }
}
