import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import Swal from 'sweetalert2'

export default class extends Controller {

    static targets = ['user_id', 'user_name', 'vendor_id', 'quote_id'];

    setCoHostContent(data) {
        this.user_idTarget.innerHTML = data.user_id;
        this.user_nameTarget.innerHTML = data.user_name;
        this.vendor_idTarget.innerHTML = data.vendor_id;
        this.quote_idTarget.innerHTML = data.quote_id;
    }

    open() {
        document.body.classList.add("modal-open");
        this.element.setAttribute("style", "display: block;");
        this.element.classList.add("show");
        document.body.innerHTML += '<div id="modal-backdrop" class="modal-backdrop fade show"></div>'
    }

    close() {
        document.body.classList.remove("modal-open");
        this.element.removeAttribute("style");
        this.element.classList.remove("show");
        document.getElementsByClassName("modal-backdrop")[0].remove();
    }
}


