import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "link" ]

  highlight() {
    let scrollPos = event.detail.position;
    let wh = window.innerHeight;
    let curPos = 56 + scrollPos;

    $(this.linkTargets).each((e) => {
      let link = $($(this.linkTargets)[e]);
      let item = $('#'+link.data('id'));
      let top = item.offset().top;
      let height = item.outerHeight();

      // console.log('item: '+e+' scroll: '+scrollPos+' top: '+top);
      if ((window.innerHeight + window.pageYOffset) >= $(document).height() - 100) {
        if(curPos < top) {
          link.addClass('active');
        } else {
          link.removeClass('active');
        }
      } else {
        if(curPos > top && curPos < top + height) {
          $(this.linkTargets).removeClass('active');
          link.addClass('active');
        }
      }
    });
  }
}
