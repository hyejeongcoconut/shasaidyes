import { Controller } from "stimulus";

export default class extends Controller {

    static targets = ["modal"];

    openModal() {
        let invmodalController = this.application.getControllerForElementAndIdentifier(
            this.modalTarget,
            "invmodal"
        );

        invmodalController.setCoHostContent(event.currentTarget.dataset);
        invmodalController.open();

    }

}

