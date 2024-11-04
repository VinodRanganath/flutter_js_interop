import React, { useState } from "react";
import "./App.css";
import TextField from "@mui/material/TextField";
import FlutterView from "./components/FlutterView";

const App: React.FC = () => {
  const [flutterTitle, setFlutterTitle] = useState<string>();
  const [messageFromFlutter, setMessageFromFlutter] = useState<string>();

  return (
    <div className="container">
      <div className="header">
        <div className="title">JS interoperability with flutter</div>
      </div>
      <div className="content">
        <div className="display-container">
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
          onFlutterMessageChange={setMessageFromFlutter}
        />
        <div className="display-container">
          <div className="display-text">
            {messageFromFlutter || "No message from flutter yet"}
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;
