import { Controller } from "stimulus";

export default class extends Controller {

    static targets = ["modal"];

    launchProductDeets(event) {
        let modalController = this.application.getControllerForElementAndIdentifier(
            this.modalTarget,
            "p-modal"
        );
        console.log(modalController);
        modalController.setCoHostContent(event.currentTarget.dataset);
        modalController.open();

        console.log("ghello?");
        console.log(event.currentTarget.dataset);
    }
}