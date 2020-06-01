import { Controller } from "stimulus";

export default class extends Controller {

    static targets = ["modal"];

    launchProductDeets(event) {
        let modalController = this.application.getControllerForElementAndIdentifier(
            this.modalTarget,
            "p-modal"
        );
        modalController.setCoHostContent(event.currentTarget.dataset);
        modalController.open();

        console.log(event.currentTarget);
        console.log(event.currentTarget.dataset);
    }
}