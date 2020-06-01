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

    createQuote() {
      const list_of_services = document.querySelector("#list_of_services");
      const date = document.querySelector("#date");
      const total_price = document.querySelector("#total_price");
      const booked = 1;
      const user_id = this.user_idTarget.innerHTML;
      const vendor_id = this.vendor_idTarget.innerHTML;
      const quote_id = this.quote_idTarget.innerHTML;

      fetchWithToken("/vendor/quote/update", {
          method: "PATCH",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ page: {  total_price: total_price.value,
                                          list_of_services: list_of_services.value,
                                          date: date.value,
                                          booked: booked,
                                          vendor_id: vendor_id,
                                          user_id: user_id,
                                          id: quote_id}})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data);
            window.location.replace("/vendor/dashboard");
          });
    }

    dialog(event) {
        const swalWithBootstrapButtons = Swal.mixin({
          customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
          },
          buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
          title: 'Are you sure?',
          text: "You won't be able to revert this!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes, save it!',
          cancelButtonText: 'No, cancel!',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {
            this.createQuote()
            swalWithBootstrapButtons.fire(
              'Saved!',
              'Your quote has been sent.',
              'success'
            )
          } else if (
            /* Read more about handling dismissals below */
            result.dismiss === Swal.DismissReason.cancel
          ) {
            swalWithBootstrapButtons.fire(
              'Cancelled',
              'Your quote has not been send :)',
              'error'
            )
          }
        })
      }

}

