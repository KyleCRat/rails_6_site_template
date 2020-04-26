import { Controller } from "stimulus";
import { gsap } from "gsap";

export default class extends Controller {
  static targets = ["notification"]

  connect() {
    // if (this.hasNotificationTarget) {
    //   if (window.flashTimeout) { clearTimeout(window.flashTimeout); }
    //
    //   window.flashTimeout = window.setTimeout(() => {
    //     this.close();
    //   }, 5000);
    // }
  }

  close() {
    $(this.notificationTarget).remove();
    // var height = $(this.notificationTarget).outerHeight();
    // gsap.set(this.notificationTarget, { height: height });
    // gsap.to(
    //   $(this.notificationTarget),
    //   0.25, {
    //     // y: -height,
    //     height: 0,
    //     padding: 0,
    //     onComplete: () => {
    //       this.destroy();
    //     }
    //   }
    // );
  }

  destroy() {
    // if (window.flashTimeout) { clearTimeout(window.flashTimeout); }
  }
}
