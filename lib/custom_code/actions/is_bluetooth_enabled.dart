// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<bool> isBluetoothEnabled() async {
  await FlutterBluePlus.isOn;
  await Future.delayed(const Duration(milliseconds: 100));
  final state = await FlutterBluePlus.state.first;
  if (state == BluetoothState.on) {
    print("1111111111111111111  we just enabled the bluetooth");
    return true;
  } else {
    print("11111111111111111111  we are stuck with the first step, bluetooth is not enabled");
  }
  return false;
}
