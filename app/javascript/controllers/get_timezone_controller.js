import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';
// Connects to data-controller="get-timezone"
export default class extends Controller {
  connect() {
    const isNew = $(this.element).attr('data-is-new');
    if (isNew === 'true') {
      this.changeTimezone();
    }
  }

  // eslint-disable-next-line class-methods-use-this
  changeTimezone() {
    const timezoneSelector = $('#user_timezone');
    const currentBrowserTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    timezoneSelector.val(currentBrowserTimezone);
  }
}
