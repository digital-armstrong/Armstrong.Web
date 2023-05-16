import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'
// Connects to data-controller="get-timezone"
export default class extends Controller {
  connect() {
    let is_new = $(this.element).attr("data-is-new");
    if(is_new == 'true') {
      this.changeTimezone()
    }
  }

  changeTimezone(){
    let timezoneSelector = $('#user_timezone')
    let currentBrowserTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone
    timezoneSelector.val(currentBrowserTimezone)
  }
}
