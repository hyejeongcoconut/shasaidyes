import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'result' ];

  connect() {
    const currentUrl = window.location.search;
    const pattern = /(\=)(.*)(\&)/g;
    var query = pattern.exec(currentUrl);
    this.refreshLanding(query[2])
  }

  greetWithKeyboard(event) {
    if (event.keyCode == 13) {
      this.refresh()
    }
  }

  refresh(event) {
    const query = document.querySelector("#search_query");
    const queryValue = query.value
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/user/vendors?query=${queryValue}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
      .then((data) => {
        data.forEach((element)=>{
          console.log(element)
          const pieceHeader = `<h1>${element.category}</h1>`
          search_div.insertAdjacentHTML("beforeend", pieceHeader);
          element.vendors.forEach((vendor)=>{
            const piece = `<p>Name: ${vendor.name},
                            Category: ${vendor.category},
                            City: ${vendor.city},
                            <a href="/user/vendors/${vendor.id}">See +details</a>
                            <img src="${vendor.photo_url}" alt="" width="200px" />
                            </p>`
                         search_div.insertAdjacentHTML("beforeend", piece);

          });//Vendors Finished
        });//For Each end
    });
  }

  refreshLanding(param) {
    const queryValue = param
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/user/vendors?query=${queryValue}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
      .then((data) => {
        data.forEach((element)=>{
          console.log(element)
          const pieceHeader = `<h1>${element.category}</h1>`
          search_div.insertAdjacentHTML("beforeend", pieceHeader);
          element.vendors.forEach((vendor)=>{
            const piece = `<p>Name: ${vendor.name},
                            Category: ${vendor.category},
                            City: ${vendor.city},
                            <a href="/user/vendors/${vendor.id}">See +details</a>
                            <img src="${vendor.photo_url}" alt="" width="200px" />
                            </p>`
                         search_div.insertAdjacentHTML("beforeend", piece);

          });//Vendors Finished
        });//For Each end
    });
  }


}// FINISH IMPORT FUNCTION
