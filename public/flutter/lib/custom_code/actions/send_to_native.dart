// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future<String?> sendToNative(String message) async {
  // Add your function code here!
  try {
    final platform = MethodChannel('flutter.integration');
    final String result = await platform.invokeMethod('pingAndroid', message);
    return result;
  } catch (e) {
    print('flutter_integration: sendMessageToNative: failed with error: $e');
    return null;
  }
}
