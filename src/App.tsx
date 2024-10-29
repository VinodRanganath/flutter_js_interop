import React from 'react';
import './App.css';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import FlutterView from './FlutterView';

const App: React.FC = () => {
  return (
    <div className="container">
      <div className="header">
        <div className="title">JS interoperability with flutter</div>
      </div>
      <div className="content">
        <div className="input-container">
          <div className="input-field-wrapper">
            <TextField fullWidth label="Message to flutter" variant="standard" color="secondary" />
          </div>
          <div className="cta-wrapper">
            <Button variant="contained">Send to flutter</Button>
          </div>
        </div>
        <FlutterView
          assetBase={process.env.PUBLIC_URL + '/web/'}
          src={process.env.PUBLIC_URL + '/web/main.dart.js'}
        />
      </div>
    </div>
  );
}

export default App;
