import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import Swal from 'sweetalert2'


export default class extends Controller {
  static targets = [ 'favorite' ];


  add(event) {
    const user_id_query = document.querySelector("#user_id");
    const vendor_id_query = document.querySelector("#vendor_id");
    const user_id = parseInt(user_id_query.innerText,10)
    const vendor_id = parseInt(vendor_id_query.innerText,10)

    fetchWithToken("/user/favorite_vendors", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ favorite_vendor: { user_id: user_id, vendor_id: vendor_id }})
      })
        .then(response => response.json())
        .then((data) => {
          window.location.replace("/user/dashboard");
        });
  }

  addVendor(event) {
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-success',
          cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
      })

      swalWithBootstrapButtons.fire({
        title: 'Do you want to add this vendor?',
        text: "This looks nice !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, add it!',
        cancelButtonText: 'No, cancel!',
        reverseButtons: true
      }).then((result) => {
        if (result.value) {
          this.add()
          swalWithBootstrapButtons.fire(
            'Saved!',
            'Vendor has been added to your favorites.',
            'success'
          )
        } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
        ) {
          swalWithBootstrapButtons.fire(
            'Cancelled',
            'Later you can try again :)',
            'error'
          )
        }
      })
    }

}
