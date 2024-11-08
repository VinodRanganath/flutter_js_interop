// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future initNativeMethodChannel() async {
  // Add your function code here!
  try {
    final platform = MethodChannel('flutter.integration');
    platform.setMethodCallHandler((MethodCall call) async {
      try {
        if (call.method == 'launch') {
          final data = call.arguments;
          FFAppState().receivedValue = data['value'];
        }
      } catch (e) {
        print(
            'flutter_integration: receiveFromNative: setMethodCallHandler: failed with error: $e');
      }
    });
  } catch (e) {
    print('flutter_integration: receiveFromNative: failed with error: $e');
  }
}
