import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isFetchingDevices = false;

  bool isBluetoothEnabled = false;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDeviceStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  List<BTDeviceStruct> connectedDevices = [];
  void addToConnectedDevices(BTDeviceStruct item) => connectedDevices.add(item);
  void removeFromConnectedDevices(BTDeviceStruct item) =>
      connectedDevices.remove(item);
  void removeAtIndexFromConnectedDevices(int index) =>
      connectedDevices.removeAt(index);
  void insertAtIndexInConnectedDevices(int index, BTDeviceStruct item) =>
      connectedDevices.insert(index, item);
  void updateConnectedDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connectedDevices[index] = updateFn(connectedDevices[index]);

  bool? isFetchingConnectedDevices = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getConnectedDevices] action in HomePage widget.
  List<BTDeviceStruct>? fetchedConnectedDevices;
  // Stores action output result for [Custom Action - findDevices] action in HomePage widget.
  List<BTDeviceStruct>? fetchedDevices;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // Stores action output result for [Custom Action - turnOnBluetooth] action in Switch widget.
  bool? isTurningOn1;
  // Stores action output result for [Custom Action - turnOnBluetooth] action in Switch widget.
  bool? isTurningOn2;
  // Stores action output result for [Custom Action - turnOffBluetooth] action in Switch widget.
  bool? isTurningOff;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Custom Action - connectDevice] action in ScannedDeviceTile widget.
  bool? hasWrite;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
