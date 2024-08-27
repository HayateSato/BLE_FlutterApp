// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'index.dart'; // Imports other custom actions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Future<List<BTDeviceStruct>> findDevices() async {
//   // final flutterBlue = FlutterBluePlus;
//   List<BTDeviceStruct> empty_devices = [];
//   print("+++++++++++++++ this is the result of scanning: ");
//   print(empty_devices);

//   try {
//     FlutterBluePlus.scanResults.listen((listOfDevicesAroundMe) {
//       List<ScanResult> scannedDevices = [];
//       print("this is inside the parameter of the .listen function: ");
//       print(listOfDevicesAroundMe);

//       for (ScanResult oneDevice in listOfDevicesAroundMe) {
//         if (oneDevice.device.name.isNotEmpty) {
//           scannedDevices.add(oneDevice);
//           print("+++++++++++++++++ this is the result of scanning for scannedDevices: ");
//           print("--------------------------------------------- this for loop is running");
//           print(empty_devices);
//           print(scannedDevices);
//         }
//       }
//       scannedDevices.sort((a, b) => b.rssi.compareTo(a.rssi));
//       empty_devices.clear();
//       print("+++++++++++++++++++ this is the result of scanning after clearning: ");
  
//       print(empty_devices);
//       print(scannedDevices);
//       scannedDevices.forEach((deviceResult) {
//         empty_devices.add(BTDeviceStruct(
//           name: deviceResult.device.name,
//           id: deviceResult.device.id.toString(),
//           rssi: deviceResult.rssi,
//         ));
//       });
//       print("++++++++++++++++++++++ this is the result of scanning final: ");
//       print(empty_devices);
//       print(scannedDevices);
//     });
//     final isScanning = FlutterBluePlus.isScanningNow;
//     if (!isScanning) {
//       await FlutterBluePlus.startScan(
//         timeout: const Duration(seconds: 5),
//       );
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return empty_devices;
// }
