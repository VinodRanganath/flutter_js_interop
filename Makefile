populate-flutter-module:
	mkdir -p flutter && cp -r ../../flutterflow/hello_world_module/ ./public/flutter

updade-flutter-module:
	cp -r ./public/flutter/build/web ./public