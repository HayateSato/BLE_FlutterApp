// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<List<BTDeviceStruct>> findDevices() async {
  List<BTDeviceStruct> devices = [];

  print("44444444444444444444444444444444   This is = Find Device file =");

  // Listen to Bluetooth adapter state changes
  var adapterSubscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
    print("Bluetooth Adapter State: $state");

    if (state == BluetoothAdapterState.on) {
      print("444444444444222222222222222222222   Bluetooth is ON. Starting scan...");

      // Start scanning for devices
      await FlutterBluePlus.startScan(
        // withNames: ["MyESP32_Server"], // Adjust device names as needed
        timeout: Duration(seconds: 15), androidUsesFineLocation: true
      );

      // Listen to scan results
      var scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
        for (ScanResult r in results) {
          print("444444442222222222222222  loop testing! ");
          print('${r.device.remoteId}:"${r.advertisementData.advName}"found!');
        }
      });

      // Wait for the scan to finish and then cancel the scan subscription
      await FlutterBluePlus.isScanning.where((val) => val == false).first;
      await scanSubscription.cancel();
    } else {
      print("Bluetooth is NOT ON. Please enable Bluetooth.");
    }
  });








  var subscription = FlutterBluePlus.onScanResults.listen((results) {
    for (ScanResult r in results) {
      devices.add(BTDeviceStruct(
        id: r.device.remoteId.toString(),
        name: r.advertisementData.advName,
      ));
      print("------------------------ this for loop is running");
    }
  });

  // await FlutterBluePlus.startScan(
  //   withServices: [Guid("180D")],
  //   withNames: ["Bluno"],
  //   timeout: Duration(seconds: 15),
  // );

  await FlutterBluePlus.isScanning.where((val) => val == false).first;

  FlutterBluePlus.cancelWhenScanComplete(subscription);

  print(devices);
  return devices;
}