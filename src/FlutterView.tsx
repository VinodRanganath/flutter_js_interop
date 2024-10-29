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
            _flutter.loader.loadEntrypoint({
                entrypointUrl: src,
                onEntrypointLoaded: async (engineInitializer: any) => {
                    const appRunner = await engineInitializer.initializeEngine({
                        hostElement: target,
                        assetBase,
                    });
                    console.log('appRunner:', appRunner);
                    await appRunner?.runApp();
                },
            });
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
