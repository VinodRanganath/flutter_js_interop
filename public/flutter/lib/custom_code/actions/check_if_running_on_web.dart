// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart' show kIsWeb;

Future checkIfRunningOnWeb() async {
  // Add your function code here!
  FFAppState().isWeb = kIsWeb ? true : false;
  ;
}
