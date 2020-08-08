import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "select" ]

  connect() {
    $(this.selectTarget).select2({
      multiple: true,
      width: '100%',
      tokenSeparators: [',']
    });
  }

  teardown() {
    $(this.selectTargets).select2('destroy');
  }
}
