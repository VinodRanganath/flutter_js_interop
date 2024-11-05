import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _sentValue = '';
  String get sentValue => _sentValue;
  set sentValue(String value) {
    _sentValue = value;
  }

  String _receivedValue = 'No message from react yet';
  String get receivedValue => _receivedValue;
  set receivedValue(String value) {
    _receivedValue = value;
  }

  bool _isWeb = false;
  bool get isWeb => _isWeb;
  set isWeb(bool value) {
    _isWeb = value;
  }

  AsyncStates? _asyncState = AsyncStates.IDLE;
  AsyncStates? get asyncState => _asyncState;
  set asyncState(AsyncStates? value) {
    _asyncState = value;
  }
}
