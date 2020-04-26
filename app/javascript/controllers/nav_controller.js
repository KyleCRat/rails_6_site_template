import { Controller } from "stimulus"
import { gsap } from "gsap";

export default class extends Controller {
  static targets = [ "menu" ];

  toggle() {
    let html = $('html'),
        openClass = 'nav-active';

    if(html.hasClass(openClass)) {
      this.close();
    } else {
      this.open();
    }
  }

  open() {
    let html = $('html'),
        openClass = 'nav-active';

    html.addClass(openClass);
  }

  close() {
    let html = $('html'),
        openClass = 'nav-active';

    html.removeClass(openClass);
  }
}
