import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "counter", "wrapper" ]

  connect(e) {
    this.update(e);
  }

  update(e) {
    let count   = $(this.inputTarget).val().length,
        input   = $(this.inputTarget),
        wrapper = $(this.wrapperTarget).parent('.input');

    // if(input.data('max-characters')) {
    //   let maxCharacters = input.data('max-characters');
    //
    //   if(count > maxCharacters && !wrapper.hasClass('error')) {
    //     wrapper.addClass('error');
    //     wrapper.find('.hint').before('<small class="error">Maximum '+maxCharacters+' characters.</small>')
    //   } else if (count <= maxCharacters && wrapper.hasClass('error')) {
    //     wrapper.removeClass('error');
    //     wrapper.find('.error').remove();
    //   }
    // }

    $(this.counterTarget).html(count);
  }
}
