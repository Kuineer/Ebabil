import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'stylesheet.dart';

CallNumber(String number) async {
  await FlutterPhoneDirectCaller.callNumber(number);
}

Color StylesheetColor(String code) {
  return stylesheet['*colors'][code];
}

Future<bool> IsInitialized() async {
  final sp = await SharedPreferences.getInstance();

  final bool? isInitialized = sp.getBool('initialized');
  if (isInitialized == null) {
    return false;
  } else {
    return true;
  }
}

List<String> GetDeviceLocale() {
  final String device_locale = Platform.localeName;

  return [device_locale.substring(0, 2), device_locale.substring(2, 4)];
}

void SynchronizeDLIfSet() async {
  final sp = await SharedPreferences.getInstance();

  if (sp.getString('language') == ['!']) {
    sp.setString("language", GetDeviceLocale()[0]);
  }
}

void GenerateDefaultPreferences() async {
  print('sasas');
  final sp = await SharedPreferences.getInstance();

  final device_locale = GetDeviceLocale();

  sp.setBool('initialized', true).then((d) => print(d));
  sp.setString('language', device_locale[0]).then((d) => print(d));
  sp.setString('locale_region', device_locale[1]).then((d) => print(d));
  sp.setInt('theme', 0).then((d) => print(d));
  sp.setBool('notifications', true).then((d) => print(d));
}

void SetLocale(String language, String country_code) async {
  final sp = await SharedPreferences.getInstance();

  sp.setString('language', language);
  sp.setString('country_code', country_code);
}