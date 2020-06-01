import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["modal"];

  launchModal() {
          let modalController = this.application.getControllerForElementAndIdentifier(
              this.modalTarget,
              "modal"//Controller modal controller.js
          );

          modalController.setCoHostContent(event.currentTarget.dataset);
          modalController.open();
      }
}
