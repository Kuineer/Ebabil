import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'dart:convert';

CallNumber(String number) async {
  await FlutterPhoneDirectCaller.callNumber(number);
}

Future<Map<String, dynamic>> LoadJSON(String path) async {
  final String json_string = await rootBundle.loadString(path);
  final data = await json.decode(json_string);

  return data;
}