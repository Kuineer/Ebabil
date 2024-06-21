import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configurations/dart_maps/stylesheet.dart';
import '../configurations/functions.dart';

class Otel {
  final String ad;
  final String aciklama;
  final double fiyat;

  Otel({required this.ad, required this.aciklama, required this.fiyat});
}

class Accomodation extends StatelessWidget {
  final List<Otel> oteller = [
    Otel(ad: 'Grand Hotel', aciklama: 'Lüks bir otel', fiyat: 250),
    Otel(ad: 'Sunset Resort', aciklama: 'Deniz kenarında tatil köyü', fiyat: 180),
    Otel(ad: 'Azure Beach Hotel', aciklama: 'Plaj manzaralı', fiyat: 300),
    Otel(ad:'Ebabil otel', aciklama:'Tatlı bir pansiyon', fiyat:150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylesheetColor(stylesheet['Scaffold']['backgroundColor']),
      appBar: AppBar(
          backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
          title: Text('Konaklama',
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
            trailing: Text('\$${otel.fiyat.toStringAsFixed(2)}'),
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
