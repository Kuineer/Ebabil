import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

CallNumber(String number) async {
  await FlutterPhoneDirectCaller.callNumber(number);
}