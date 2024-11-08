import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for messageToReact widget.
  FocusNode? messageToReactFocusNode;
  TextEditingController? messageToReactTextController;
  String? Function(BuildContext, String?)?
      messageToReactTextControllerValidator;
  // Stores action output result for [Custom Action - sendToNative] action in messageToReact widget.
  String? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageToReactFocusNode?.dispose();
    messageToReactTextController?.dispose();
  }
}
