import React, { useState } from "react";
import "./App.css";
import TextField from "@mui/material/TextField";
import FlutterView from "./components/FlutterView";

export enum ASYNC_STATES {
  REQUESTED = "REQUESTED",
  SUCCESS = "SUCCESS",
  ERROR = "ERROR",
  IDLE = "IDLE",
};

const App: React.FC = () => {
  const [flutterTitle, setFlutterTitle] = useState<string>();
  const [messageFromFlutter, setMessageFromFlutter] = useState<string>();
  const [asyncState, setAsyncState] = useState<ASYNC_STATES>(ASYNC_STATES.IDLE);

  const asyncCallback = async (status: string) => {
    console.log('App: asyncCallback:', status.toString());
    if (status === ASYNC_STATES.REQUESTED.toString()) {
      setTimeout(() => setAsyncState(ASYNC_STATES.SUCCESS), 5000);
    }
  };

  return (
    <div className="container">
      <div className="header">
        <div className="title">JS interoperability with flutter</div>
      </div>
      <div className="content">
        <div className="input-container">
          <div className="input-field-wrapper">
            <TextField
              fullWidth
              label="Message to flutter"
              variant="standard"
              color="secondary"
              onChange={(event) => setFlutterTitle(event.target.value)}
            />
          </div>
        </div>
        <FlutterView
          flutterTitle={flutterTitle}
          asyncState={asyncState}
          onFlutterMessageChange={setMessageFromFlutter}
          asyncCallback={asyncCallback}
        />
        <div className="info-container">
          <div className="info-wrapper" style={{"borderBottomLeftRadius": 10}}>
            <div className="display-text-info">Message from flutter</div>
            <div className="display-text">
              {messageFromFlutter || "No message from flutter yet"}
            </div>
          </div>
          <div className="info-wrapper" style={{"borderBottomRightRadius": 10}}>
            <div className="display-text-info">Async state</div>
            <div className="display-text">
              {asyncState}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;
