
// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Future<bool> turnOnBluetooth() async {
//   if (isAndroid) {
//     await FlutterBluePlus.turnOn();
//   }
//   return true;
// }

import 'dart:io'; // Import to check the platform


// below is copied from "is_bluetooth_enabled" -----------------------------------------------------




// Future<bool> isBluetoothEnabled() async {
//   print("!!!!!!!!!!!!!!!!!!!!!!!!!!!isBluetoothEnabled() ____ we are running the turn_on_bluetooth dart file");
//   await FlutterBluePlus.isOn;
//   await Future.delayed(const Duration(milliseconds: 100));
//   final state = await FlutterBluePlus.state.first;
//   if (state == BluetoothState.on) {
//     print("+++++++++++++++++++++ Turn_on_bluetooth.dart: we just enabled the bluetooth");
//     return true;
//   } else {
//     print("xxxxxxxxxxxxxxxxxxxxxxxx Turn_on_bluetooth.dart: we are stuck with the first step, bluetooth is not enabled");
//   }
//   return false;

// }


// above is copied from "is_bluetooth_enabled" -----------------------------------------------------



// Assuming actions is an object that contains the turnOnBluetooth method

Future<bool> turnOnBluetooth() async {
  print("!!!!!!!!!!!!!!!!!!!!!!!!!!!turnOnBluetooth()___ we are running the turn_on_bluetooth dart file");
  if (Platform.isAndroid) {
    await FlutterBluePlus.turnOn();
    print("!!!!!!!!!!!!!!!!!!!!!!!!!if is true");
    
    

    //-----------------------------------------------------------------------------------------
  
    var adapterSubscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
    print("Bluetooth Adapter State: $state");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!! adapterSubscription_____ we are running the turn_on_bluetooth dart file");

      if (state == BluetoothAdapterState.on) {
        // Start scanning when Bluetooth is turned on
        print("++++++++++++++++++++++++++ (BluetoothAdapterState.on) Bluetooth is ON. Starting scan...");

        // Start scanning for devices
        await FlutterBluePlus.startScan(
          // withServices: [Guid("180D")], // Adjust service UUIDs as needed
          withNames: ["MyESP32_Server"], // Adjust device names as needed
          timeout: Duration(seconds: 15),
        );

        // await FlutterBluePlus.startScan(timeout: Duration(seconds: 15));

        // FlutterBluePlus.scanResults.listen((results) {
        //   for (ScanResult r in results) {
        //     print('Device found: ${r.device.name}, RSSI: ${r.rssi}');
        //     print("using chatGPT code");
        //   }
        // });
        

        // Listen to scan results
        var scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
          for (ScanResult r in results) {
            print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
            print("not chat GPT --- Original");
          }
        });

        // Wait for the scan to finish and then cancel the scan subscription
        await FlutterBluePlus.isScanning.where((val) => val == false).first;
        await scanSubscription.cancel();
      } else {
        // Handle cases where Bluetooth is not on
        print("-------------------- else (BluetoothAdapterState.on not on ) Bluetooth is NOT ON. Please enable Bluetooth.");
      }
        // await adapterSubscription.cancel();
    });

    //-----------------------------------------------------------------------------------------
    return true;
  } else {
    print("!!!!!!!!!!!!!!!!!!!!!!!!!if is NOT true");
    return false; // iOS or other platforms where Bluetooth can't be turned on programmatically
  }

// First, check if Bluetooth is supported by the hardware.
  bool isSupported = await FlutterBluePlus.isSupported;
  if (!isSupported) {
    print("Bluetooth not supported by this device");
    return false;
  }
}



void main() async {
  print("!!!!!!!!!!!!!!!!!!!!!!!!!!! main____ we are running the turn_on_bluetooth dart file");
  // Actions actions = Actions(); // Initialize your actions object

  // First, check if Bluetooth is supported by the hardware.
  bool isSupported = await FlutterBluePlus.isSupported;
  if (!isSupported) {
    print("Bluetooth not supported by this device");
    return;
  }

  // -------- we bring these to above, inside the nested if ------------------

  // Listen to the Bluetooth adapter state changes
  var adapterSubscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
    print("Bluetooth Adapter State: $state");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!! adapterSubscription_____ we are running the turn_on_bluetooth dart file");

    // if (state == BluetoothAdapterState.on) {
    //   // Start scanning when Bluetooth is turned on
    //   print("++++++++++++++++++++++++++ Bluetooth is ON. Starting scan...");

    //   // Start scanning for devices
    //   await FlutterBluePlus.startScan(
    //     // withServices: [Guid("180D")], // Adjust service UUIDs as needed
    //     // withNames: ["Bluno"], // Adjust device names as needed
    //     timeout: Duration(seconds: 15),
    //   );

    //   // Listen to scan results
    //   var scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
    //     for (ScanResult r in results) {
    //       print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
    //     }
    //   });

    //   // Wait for the scan to finish and then cancel the scan subscription
    //   await FlutterBluePlus.isScanning.where((val) => val == false).first;
    //   await scanSubscription.cancel();
    // } else {
    //   // Handle cases where Bluetooth is not on
    //   print("-------------------- Bluetooth is NOT ON. Please enable Bluetooth.");
    // }
  });

// -------- we bring these to above, inside the nested if ------------------


  // Turn on Bluetooth programmatically if possible (Android only)
  if (Platform.isAndroid) {
    bool isTurningOn = await turnOnBluetooth();
    if (isTurningOn) {
      print("Bluetooth is being turned on...");
    } else {
      print("Failed to turn on Bluetooth. Please enable it manually.");
    }
  }

  // Cancel the adapter state subscription to prevent memory leaks
  await adapterSubscription.cancel();
}