import { Controller } from "stimulus";
import { gsap } from "gsap"

export default class extends Controller {
  static targets = [ "hideable", "showable" ]

  animate() {
    window.titleHidden = window.titleHidden || false;

    if(event.detail.position < 70 && window.titleHidden == true) {
      gsap.to($(this.showableTargets), { width: 0, duration: .15, ease: "power1.in"});
      gsap.to($(this.hideableTargets), { width: 'auto', duration: .3, ease: "power1.out"});
      window.titleHidden = false;
    } else if( event.detail.position >= 70 && window.titleHidden == false) {
      gsap.to($(this.hideableTargets), { width: 0, duration: .15, ease: "power1.in"});
      gsap.to($(this.showableTargets), { width: 'auto', duration: .3, ease: "power1.out"});
      window.titleHidden = true;
    }
  }
}
