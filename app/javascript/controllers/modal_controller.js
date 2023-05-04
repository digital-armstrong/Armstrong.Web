import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ['container'];

  connect() {
    this.toggleClass = 'hidden';
    this.backgroundId = 'modal-background';
    this.backgroundHtml = this._backgroundHTML();
  }

  disconnect() {
    this.close();
  }

  open() {
    document.getElementById("modal").classList.remove('d-none');
    document.getElementById("modal").classList.add('d-flex');
    document.body.classList.add('fixed', 'inset-x-0', 'overflow-hidden');
    this.containerTarget.classList.remove(this.toggleClass);
    if (this.background) { this.background.remove() }
    document.body.insertAdjacentHTML('beforeend', this.backgroundHtml);
    this.background = document.querySelector(`#${this.backgroundId}`);
  }

  close() {
    if (typeof event !== 'undefined') {
      event.preventDefault()
    }
    this.containerTarget.classList.add(this.toggleClass);
    if (this.background) { this.background.remove() }
    document.getElementById("modal").classList.remove('d-flex');
    document.getElementById("modal").classList.add('d-none');
  }

  _backgroundHTML() {
    return `<div id="${this.backgroundId}" style="position:fixed;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    background: #ffffff;
    opacity: 0.4;
    text-align: center"></div>`;
  }
}