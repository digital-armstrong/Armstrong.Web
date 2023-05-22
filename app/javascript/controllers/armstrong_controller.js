import { Controller } from '@hotwired/stimulus';
import React from 'react';
import { createRoot } from 'react-dom/client';
import Root from '../Components/Root';

export default class extends Controller {
  // eslint-disable-next-line class-methods-use-this
  connect() {
    const app = document.getElementById('app');
    const root = createRoot(app);
    root.render(<Root />);
  }
}
