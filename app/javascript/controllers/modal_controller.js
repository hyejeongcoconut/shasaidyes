import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {

    static targets = ['user_id', 'user_name', 'vendor_id'];

    // Displays the captured data
    setCoHostContent(data) {
            this.user_idTarget.innerHTML = data.user_id;
            this.user_nameTarget.innerHTML = data.user_name;
            this.vendor_idTarget.innerHTML = data.vendor_id;
        }

    // JS function to open the modal
    open() {
      document.body.classList.add("modal-open");
      this.element.setAttribute("style", "display: block;");
      this.element.classList.add("show");
      document.body.innerHTML += '<div id="modal-backdrop" class="modal-backdrop fade show"></div>'
    }
    // JS function to close the modal
    close() {
            document.body.classList.remove("modal-open");
            this.element.removeAttribute("style");
            this.element.classList.remove("show");
            document.getElementsByClassName("modal-backdrop")[0].remove();
        }
    
    // Captures the user form info and makes "POST" request
    createQuote() {
      const list_of_services = document.querySelector("#list_of_services");
      const date = document.querySelector("#date");
      const total_price = document.querySelector("#total_price");
      const booked = 0;
      const user_id = this.user_idTarget.innerHTML;
      const vendor_id = this.vendor_idTarget.innerHTML;

      fetchWithToken("/vendor/quote/create", {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ page: { total_price: total_price.value,
                                          list_of_services: list_of_services.value,
                                          date: date.value,
                                          booked: booked,
                                          vendor_id: vendor_id,
                                          user_id: user_id}})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data);
            window.location.replace("/vendor/dashboard");
          });

    }
}

