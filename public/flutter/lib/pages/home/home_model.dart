import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_widget.dart' show HomeWidget;
import 'package:hello_world_design_library_3pf989/flutter_flow/flutter_flow_util.dart'
    as hello_world_design_library_3pf989_util show wrapWithModel, createModel;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world_design_library_3pf989/components/primary_c_t_a_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  double progressIndicatorValue = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for messageToReact widget.
  FocusNode? messageToReactFocusNode;
  TextEditingController? messageToReactTextController;
  String? Function(BuildContext, String?)?
      messageToReactTextControllerValidator;
  // Stores action output result for [Custom Action - sendToNative] action in messageToReact widget.
  String? response;
  // Model for PrimaryCTA component.
  late PrimaryCTAModel primaryCTAModel;
  InstantTimer? progressIncrementTimer;

  @override
  void initState(BuildContext context) {
    primaryCTAModel = hello_world_design_library_3pf989_util.createModel(
        context, () => PrimaryCTAModel());
  }

  @override
  void dispose() {
    messageToReactFocusNode?.dispose();
    messageToReactTextController?.dispose();

    primaryCTAModel.dispose();
    progressIncrementTimer?.cancel();
  }
}
