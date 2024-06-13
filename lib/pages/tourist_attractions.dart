import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Yer {
  final String ad;
  final String aciklama;
  final String district;

  Yer({required this.ad, required this.aciklama, required this.district});
}

class TouristAttractions extends StatelessWidget {
  final List<Yer> oteller = [
    Yer(ad: 'Atakule', aciklama: "Ankara'nın komünikasyon ve seyir kulesi.", district: 'Çankaya'),
    Yer(ad: 'Ankara Castle', aciklama: "Ankara'nın tarihî kalesi.", district: 'Altındağ')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turistik Yerler'),
      ),
      body: ListView.builder(
        itemCount: oteller.length,
        itemBuilder: (context, index) {
          final otel = oteller[index];
          return ListTile(
            title: Text(otel.ad),
            subtitle: Text(otel.aciklama),
            trailing: Text(otel.district),
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
