import 'package:flutter/material.dart';

import 'stylesheet.dart';

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

Widget NavigationButton(String label, IconData icon, String route, BuildContext build_context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(build_context, route);
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