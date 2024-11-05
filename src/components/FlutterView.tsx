import React, { memo, useEffect, useRef } from "react";
import CircularProgress from "@mui/material/CircularProgress";
import "../App.css";
import { ASYNC_STATES } from "../App";

declare var _flutter: any;

interface FlutterViewProps {
  flutterTitle: string | undefined;
  asyncState: ASYNC_STATES;
  onFlutterMessageChange: (message: string) => void;
  asyncCallback: (status: string) => void;
}

const FlutterView: React.FC<FlutterViewProps> = memo(
  ({ flutterTitle, asyncState, onFlutterMessageChange, asyncCallback }) => {
    const flutterState = useRef<any>(null);
    const ref = useRef<HTMLDivElement>(null);

    const onFlutterModuleLoad = (state: any) => {
      console.log("FlutterView: onFlutterModuleLoad: state", state);
      state.setFlutterTitle(flutterTitle);
      state.setAsyncState(asyncState.toString());
      state.onMessageToReactChanged(onFlutterMessageChange);
      state.asyncCallback(asyncCallback);
      flutterState.current = state;
    };

    const flutterEventListener = (event: Event) => {
      const flutterState = (event as CustomEvent).detail;
      onFlutterModuleLoad(flutterState);
    };

    useEffect(() => {
      const target = ref.current;

      const initFlutterApp = async () => {
        const entryPoint = "/web/";

        _flutter.buildConfig = {
          builds: [
            {
              compileTarget: "dart2js",
              renderer: "canvaskit",
              mainJsPath: "main.dart.js",
            },
          ],
          useLocalCanvasKit: true,
        };
        _flutter.loader.load({
          config: {
            canvasKitBaseUrl: `${entryPoint}canvaskit`,
            entryPointBaseUrl: entryPoint,
          },
          onEntrypointLoaded: async (engineInitializer: any) => {
            try {
              const appRunner = await engineInitializer.initializeEngine({
                assetBase: entryPoint,
                hostElement: target,
              });

              await appRunner?.runApp();

              target?.addEventListener(
                "flutter-initialized",
                flutterEventListener,
                {
                  once: true,
                }
              );
            } catch (e) {
              console.log("FlutterView: engineInitializer: failed:", e);
              initFlutterApp();
            }
          },
        });
      };

      initFlutterApp().catch((e) =>
        console.log("FlutterView: initFlutterApp: failed with error:", e)
      );

      return () => {
        target?.removeEventListener(
          "flutter-initialized",
          flutterEventListener
        );
      };
    }, []); // eslint-disable-line react-hooks/exhaustive-deps

    useEffect(
      () => flutterState.current?.setFlutterTitle(flutterTitle || null),
      [flutterTitle]
    );

    useEffect(
      () => flutterState.current?.setAsyncState(asyncState.toString()),
      [asyncState]
    );

    return (
      <div ref={ref} className="flutter-view">
        <CircularProgress />
      </div>
    );
  }
);

export default FlutterView;
