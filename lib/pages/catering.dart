import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configurations/dart_maps/stylesheet.dart';
import '../configurations/functions.dart';

class Restoran {
  final String ad;
  final String aciklama;

  Restoran({required this.ad, required this.aciklama});
}

class Catering extends StatelessWidget {
  final List<Restoran> oteller = [
    Restoran(ad: 'Leziz Tavuk', aciklama: 'Ucuz tavuk restoranı'),
    Restoran(ad: 'Pizza Şatosu', aciklama: 'Şehrin merkezinde bir sınırsız pizzacı')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
          backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
          title: Text('Yeme İçme',
              style: TextStyle(color: StylesheetColor(stylesheet['AppBar']['title']['style']['color']))
          )
      ),
      body: ListView.builder(
        itemCount: oteller.length,
        itemBuilder: (context, index) {
          final otel = oteller[index];
          return ListTile(
            title: Text(otel.ad),
            subtitle: Text(otel.aciklama),
            onTap: () {
              if (kDebugMode) {
                print('${otel.ad} seçildi.');
              }
            },
          );
        },
      ),
    );
  }
}
