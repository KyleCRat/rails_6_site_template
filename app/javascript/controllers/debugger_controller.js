import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "panel", "width", "height" ]

    connect() {
        var resizing

        $(this.widthTarget).html(window.outerWidth + 'px');
        $(this.heightTarget).html(window.outerHeight + 'px');

        $(window).resize(() => {
            clearTimeout(resizing);
            resizing = setTimeout(() => this.resizingFinished(), 300)
        });
    }

    resizingFinished() {
        $(this.widthTarget).html(window.outerWidth + 'px');
        $(this.heightTarget).html(window.outerHeight + 'px');
    }

    close() {
        $(this.panelTarget).remove();
    }
}
