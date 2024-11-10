import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secondary_c_t_a_model.dart';
export 'secondary_c_t_a_model.dart';

class SecondaryCTAWidget extends StatefulWidget {
  /// CTA with secondary colour scheme
  const SecondaryCTAWidget({
    super.key,
    required this.title,
    this.onClick,
  });

  final String? title;
  final Future Function()? onClick;

  @override
  State<SecondaryCTAWidget> createState() => _SecondaryCTAWidgetState();
}

class _SecondaryCTAWidgetState extends State<SecondaryCTAWidget> {
  late SecondaryCTAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryCTAModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 500.0,
        height: 40.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).secondary,
              FlutterFlowTheme.of(context).secondaryBackground
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, 0.0),
            end: AlignmentDirectional(-1.0, 0),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: FFButtonWidget(
          onPressed: () async {
            await widget.onClick?.call();
          },
          text: widget!.title!,
          options: FFButtonOptions(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: Color(0x00FFD700),
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
            elevation: 0.0,
          ),
          showLoadingIndicator: false,
        ),
      ),
    );
  }
}
