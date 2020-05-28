import { Controller } from "stimulus";
import { fetchWithToken } from "../utils/fetch_with_token";

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
          console.log(data);
        });
  }
}
