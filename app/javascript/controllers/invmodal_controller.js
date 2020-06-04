import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";
import Swal from 'sweetalert2'

export default class extends Controller {

    static targets = ['date', 'list_of_services', 'total_price', 'quote_id'];

    setCoHostContent(data) {
        const newDate = this.formatDate(data.date)
        this.dateTarget.innerHTML = newDate ;
        this.list_of_servicesTarget.innerHTML = data.list_of_services;
        this.total_priceTarget.innerHTML = data.total_price;
        this.quote_idTarget.innerHTML = data.quote_id;
    }


    formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
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

    confirmOrder() {
      // const list_of_services = document.querySelector("#list_of_services");
      // const date = document.querySelector("#date");
      // const total_price = document.querySelector("#total_price");
       const booked = 2;
      // const user_id = this.user_idTarget.innerHTML;
      // const vendor_id = this.vendor_idTarget.innerHTML;
       const quote_id = this.quote_idTarget.innerHTML;

      fetchWithToken("/user/quote/pay", {
          method: "PATCH",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ page: { booked: 2, id: quote_id }})
        })
          .then(response => response.json())
          .then((data) => {

            this.purchase()
            //window.location.replace("/user/favorite_vendors");
          });

    }

    purchase() {
      const quote_id = this.quote_idTarget.innerHTML
      const list_of_services = this.list_of_servicesTarget.innerHTML
      const total_price = this.total_priceTarget.innerHTML
      const date = this.dateTarget.innerHTML
      window.location.replace(`/user/dashboard/payment?quote_id=${quote_id}&list_of_services=${list_of_services}&total_price=${total_price}&date=${date}`);


    }

    payOrder(event) {
        const swalWithBootstrapButtons = Swal.mixin({
          customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
          },
          buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
          title: 'Are you sure to proceed with the payment?',
          text: "You won't be able to revert this!",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes, pay it!',
          cancelButtonText: 'No, cancel!',
          reverseButtons: true
        }).then((result) => {
          if (result.value) {
            this.confirmOrder()
            swalWithBootstrapButtons.fire(
              'Saved!',
              'Your payment has been accepted.',
              'success'
            )
          } else if (
            /* Read more about handling dismissals below */
            result.dismiss === Swal.DismissReason.cancel
          ) {
            swalWithBootstrapButtons.fire(
              'Cancelled',
              'Your payment has not been sent :)',
              'error'
            )
          }
        })
      }
}


