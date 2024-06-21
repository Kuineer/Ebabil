import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'dart_maps/stylesheet.dart';

CallNumber(String number) async {
  await FlutterPhoneDirectCaller.callNumber(number);
}

Color StylesheetColor(String code) {
  return Color(stylesheet['*colors'][code]);
}