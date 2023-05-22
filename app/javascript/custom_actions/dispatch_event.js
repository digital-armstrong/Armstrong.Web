import { StreamActions } from '@hotwired/turbo';

// eslint-disable-next-line func-names
StreamActions.dispatch_event = function () {
  const name = this.getAttribute('name');
  const event = new Event(name);
  window.dispatchEvent(event);
  // If you want to send the event somewhere besides the window
  // document.getElementById(this.target).dispatchEvent(event)
};
