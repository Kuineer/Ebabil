import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../functions.dart';
import '../stylesheet.dart';

class Attraction {
  final String name;
  final String description;
  final String district;

  Attraction({required this.name, required this.description, required this.district});
}

class TouristAttractions extends StatelessWidget {
  final List<Attraction> attractions = [
    Attraction(name: 'Atakule', description: "Ankara'nın komünikasyon ve seyir kulesi.", district: 'Çankaya'),
    Attraction(name: 'Ankara Castle', description: "Ankara'nın tarihî kalesi.", district: 'Altındağ')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
          backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
          title: Text(AppLocalizations.of(context)!.tourist_attractions,
              style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
          )
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final item = attractions[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            trailing: Text(item.district)
          );
        },
      ),
    );
  }
}
