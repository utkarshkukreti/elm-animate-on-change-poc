customElements.define(
  'animate-on-change',
  class extends HTMLElement {
    static get observedAttributes() {
      return ['text'];
    }
    attributeChangedCallback(name, previous, next) {
      if (name === 'text') {
        this.textContent = next;
        this.classList.add('changed');
        setTimeout(() => this.classList.remove('changed'), 1000);
      }
    }
  }
);

Elm.Main.fullscreen();
