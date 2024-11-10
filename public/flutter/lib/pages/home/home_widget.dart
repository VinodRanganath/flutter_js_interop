import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.messageToReactTextController ??= TextEditingController();
    _model.messageToReactFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                ),
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: GradientText(
                        FFAppState().receivedValue,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'CustomFiraCodeMono',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        colors: [
                          FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).primary
                        ],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller: _model.messageToReactTextController,
                          focusNode: _model.messageToReactFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.messageToReactTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              if (FFAppState().isWeb) {
                                await actions.updateAppState(
                                  () async {
                                    FFAppState().sentValue = _model
                                        .messageToReactTextController.text;
                                    safeSetState(() {});
                                  },
                                );
                              } else {
                                _model.response = await actions.sendToNative(
                                  _model.messageToReactTextController.text,
                                );
                                FFAppState().sentValue = _model.response!;
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Message to react',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Space Grotesk',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x4D57636C),
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Space Grotesk',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                          cursorColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          validator: _model
                              .messageToReactTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (FFAppState().isWeb)
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: hello_world_design_library_3pf989_util
                            .wrapWithModel(
                          model: _model.primaryCTAModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryCTAWidget(
                            title: 'Invoke async callback',
                            onClick: () async {
                              await actions.updateAppState(
                                () async {
                                  FFAppState().asyncState =
                                      AsyncStates.REQUESTED;
                                  safeSetState(() {});
                                },
                              );
                              _model.progressIndicatorValue = 0.0;
                              safeSetState(() {});
                              _model.progressIncrementTimer =
                                  InstantTimer.periodic(
                                duration: Duration(milliseconds: 500),
                                callback: (timer) async {
                                  _model.progressIndicatorValue =
                                      _model.progressIndicatorValue + 0.1;
                                  safeSetState(() {});
                                  if (_model.progressIndicatorValue >= 1.0) {
                                    _model.progressIncrementTimer?.cancel();
                                    _model.progressIndicatorValue = 0.0;
                                    safeSetState(() {});
                                  }
                                },
                                startImmediately: true,
                              );
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        'Are you sure you want to close this flutter module'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Confirm'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            if (FFAppState().isWeb) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Not yet implemented on web',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Space Grotesk',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).info,
                                ),
                              );
                            } else {
                              await actions.exitFlutter();
                            }
                          }
                        },
                        text: 'Close flutter module',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Space Grotesk',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      !FFAppState().isWeb &&
                          (FFAppState().sentValue != null &&
                              FFAppState().sentValue != ''),
                      false,
                    ))
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: GradientText(
                          'Message sent to native: ${FFAppState().sentValue}',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Space Grotesk',
                                    letterSpacing: 0.0,
                                  ),
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (valueOrDefault<bool>(
                            FFAppState().isWeb,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: GradientText(
                                'Async method status: ${FFAppState().asyncState?.name}',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Space Grotesk',
                                      letterSpacing: 0.0,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ),
                            ),
                          if (_model.progressIndicatorValue != 0.0)
                            CircularPercentIndicator(
                              percent: _model.progressIndicatorValue,
                              radius: 10.0,
                              lineWidth: 2.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).tertiary,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
