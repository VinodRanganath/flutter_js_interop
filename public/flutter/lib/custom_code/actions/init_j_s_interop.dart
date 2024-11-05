// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js_interop';
import 'package:js/js_util.dart';

Future initJSInterop() async {
  // Add your function code here!
  try {
    final interopStateManager = AppStateManager();
    final export = createDartExport(interopStateManager);

    final DomElement? root = document.querySelector('[flt-renderer]');
    dispatchCustomEvent(root!, 'flutter-initialized', export);
  } catch (e) {
    print('initJSInterop: failed with error: $e');
  }
}

AsyncStates getAsyncStatesEnumFromString(String value) {
  try {
    return AsyncStates.values.where((val) => val.name == value).first;
  } catch (e) {
    print('getAsyncStatesEnumFromString: failed with error: $e');
    return AsyncStates.ERROR;
  }
}

@JSExport()
class AppStateManager {
  void setFlutterTitle(String title) {
    FFAppState().update(() => FFAppState().receivedValue = title);
  }

  void setAsyncState(String state) {
    FFAppState().update(
        () => FFAppState().asyncState = getAsyncStatesEnumFromString(state));
  }

  void onMessageToReactChanged(Function(String) f) {
    FFAppState().addListener(() => f(FFAppState().sentValue));
  }

  void asyncCallback(Function(String) f) {
    FFAppState()
        .addListener(() => f(FFAppState().asyncState?.serialize() ?? ''));
  }
}

/// Use JS document API to query
/// for the current flutter window
/// and fire an event from flutter to JS
@JS('CustomEvent')
@staticInterop
class DomCustomEvent {
  external factory DomCustomEvent.withType(JSString type);
  external factory DomCustomEvent.withOptions(JSString type, JSAny options);
  factory DomCustomEvent._(String type, [Object? options]) {
    if (options != null) {
      return DomCustomEvent.withOptions(type.toJS, jsify(options) as JSAny);
    }
    return DomCustomEvent.withType(type.toJS);
  }
}

dispatchCustomEvent(DomElement target, String type, Object data) {
  final DomCustomEvent event = DomCustomEvent._(type, <String, Object>{
    'detail': data,
  });
  target.dispatchEvent(event);
}

@JS()
@staticInterop
class DomEventTarget {}

extension DomEventTargetExtension on DomEventTarget {
  @JS('dispatchEvent')
  external JSBoolean _dispatchEvent(DomCustomEvent event);
  bool dispatchEvent(DomCustomEvent event) => _dispatchEvent(event).toDart;
}

@JS()
@staticInterop
class DomElement extends DomEventTarget {}

extension DomElementExtension on DomElement {
  @JS('querySelector')
  external DomElement? _querySelector(JSString selectors);
  DomElement? querySelector(String selectors) => _querySelector(selectors.toJS);
}

@JS()
@staticInterop
class DomDocument extends DomElement {}

@JS()
@staticInterop
external DomDocument get document;
