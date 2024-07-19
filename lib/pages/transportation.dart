import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../functions.dart';
import '../stylesheet.dart';

class Transportation extends StatefulWidget {
  @override
  TransportationState createState() {
    return TransportationState();
  }
}

class TransportationState extends State<Transportation> {
  String searchText = '';
  List<String> randomTimes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.bus_schedules),
        backgroundColor: StylesheetColor(stylesheet['AppBar']['backgroundColor']),
      ),
      body: Center(
        child: Padding(
          padding: stylesheet['Center']['Padding']['padding'],
          child: Column(
            mainAxisAlignment: stylesheet['Column']['mainAxisAlignment'],
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    generateRandomTimes();
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enter_bus_route,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      stylesheet['TextField']['borderRadius']
                    )
                  )
                )
              ),
              SizedBox(height: stylesheet['SizedBox']['height']),
              Text(
                AppLocalizations.of(context)!.number_entered + searchText,
                style: TextStyle(fontSize: 20.0, color: StylesheetColor(stylesheet['Text']['style']['color']))
              ),
              SizedBox(height: stylesheet['SizedBox']['height']),
              Expanded(
                child: ListView.builder(
                  itemCount: randomTimes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        randomTimes[index],
                        style: TextStyle(color: StylesheetColor(stylesheet['Text']['style']['color']))
                      )
                    );
                  }
                )
              )
            ]
          )
        )
      )
    );
  }

  void generateRandomTimes() {
    randomTimes.clear();
    if (searchText.length == 3) {
      // Generate 5 random times
      for (int i = 0; i < 5; i++) {
        int hour = Random().nextInt(24);
        int minute = Random().nextInt(60);
        String time = '$hour:${minute.toString().padLeft(2, '0')}';
        randomTimes.add(time);
      }
    }
    setState(() {});
  }
}
