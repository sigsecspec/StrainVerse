import React from 'react';
import ReactDOM from 'react-dom/client';
import './utils/pwaInstall';
import { registerSW } from 'virtual:pwa-register';
import App from './App';

registerSW({
  immediate: true,
  onRegistered(registration) {
    if (registration) {
      registration.update();
    }
  },
});

const rootElement = document.getElementById('root');
if (!rootElement) {
  throw new Error("Could not find root element to mount to");
}

const root = ReactDOM.createRoot(rootElement);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);