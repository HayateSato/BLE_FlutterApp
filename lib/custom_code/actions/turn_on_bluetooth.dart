
// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!


import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:io'; // Import to check the platform

Future<bool> turnOnBluetooth() async {
  print("Running turnOnBluetooth()...");

  // Check if Bluetooth is supported
  bool isSupported = await FlutterBluePlus.isSupported;
  if (!isSupported) {
    print("Bluetooth not supported by this device");
    return false;
  }

  if (Platform.isAndroid) {
    await FlutterBluePlus.turnOn();
    print("Bluetooth is being turned on...");

    // Listen to Bluetooth adapter state changes
    var adapterSubscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
      print("Bluetooth Adapter State: $state");

      if (state == BluetoothAdapterState.on) {
        print("Bluetooth is ON. Starting scan...");

        // Start scanning for devices
        await FlutterBluePlus.startScan(
          withNames: ["MyESP32_Server"], // Adjust device names as needed
          timeout: Duration(seconds: 15),
        );

        // Listen to scan results
        var scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
          for (ScanResult r in results) {
            print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
          }
        });

        // Wait for the scan to finish and then cancel the scan subscription
        await FlutterBluePlus.isScanning.where((val) => val == false).first;
        await scanSubscription.cancel();
      } else {
        print("Bluetooth is NOT ON. Please enable Bluetooth.");
      }
    });

    return true;
  } else {
    print("Platform is not Android, Bluetooth cannot be turned on programmatically.");
    return false;
  }
}

void main() async {
  print("Running main...");

  // Turn on Bluetooth programmatically if possible (Android only)
  if (Platform.isAndroid) {
    bool isTurningOn = await turnOnBluetooth();
    if (isTurningOn) {
      print("Bluetooth is being turned on...");
    } else {
      print("Failed to turn on Bluetooth. Please enable it manually.");
    }
  }
}