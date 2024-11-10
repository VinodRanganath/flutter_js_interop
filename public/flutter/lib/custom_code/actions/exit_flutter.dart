// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future exitFlutter() async {
  // Add your function code here!
  try {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  } catch (e) {
    print('exitFlutter: failed with error: $e');
  }
}
