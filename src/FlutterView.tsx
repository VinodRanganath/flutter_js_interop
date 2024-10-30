import React, { memo, useEffect, useRef } from 'react';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';
import './App.css';

declare var _flutter: any;

interface FlutterViewProps {
    assetBase?: string;
    src?: string;
  }

const FlutterView: React.FC<FlutterViewProps> = memo(({
    assetBase,
    src,
}) => {
    const ref = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const target = ref.current;
        const initFlutterApp = async () => {
            _flutter.buildConfig = {
                builds:[{
                    compileTarget:"dart2js",
                    renderer:"canvaskit",
                    mainJsPath:"main.dart.js",
                }],
                useLocalCanvasKit:true,
            };
            _flutter.loader.load({
                config: {
                    canvasKitBaseUrl: "/web/canvaskit",
                    entryPointBaseUrl: "/web/",
                },
                onEntrypointLoaded: async (engineInitializer: any) => {
                    try {
                        const appRunner = await engineInitializer.initializeEngine({
                            assetBase: "/web/",
                            hostElement: target,
                        });
                        await appRunner?.runApp();
                    } catch (e) {
                        console.log('engineInitializer: failed:', e);
                    }
                },
            });

            // _flutter.loader.loadEntrypoint({
            //     entrypointUrl: "/web/main.dart.js",
            //     onEntrypointLoaded: (async (engineInitializer: any) => {
            //         const appRunner = await engineInitializer.initializeEngine({
            //             canvasKitBaseUrl: "/web/canvaskit",
            //             entryPointBaseUrl: "/web/",
            //             assetBase: "/web/",
            //             hostElement: target,
            //         });
            //         await appRunner?.runApp();
            //     }),
            // });
        };

        initFlutterApp()
            .catch((e) => console.log('FlutterView: initFlutterApp: failed with error:', e));
    }, []); // eslint-disable-line react-hooks/exhaustive-deps

    return (
        <div ref={ref} id="flutterView">
            <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100%' }}>
                <CircularProgress/>
            </Box>
        </div>
    );
});

export default FlutterView;
