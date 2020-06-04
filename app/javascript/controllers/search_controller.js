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

  // Results from when user makes searchbar query
  refresh(event) {
    const query = document.querySelector("#search_query");
    const queryValue = query.value
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/user/vendors?query=${queryValue}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
      .then((data) => {
        data.forEach((element)=>{
          element.vendors.forEach((vendor)=>{
            const resultdiv = piece(vendor)
            search_div.insertAdjacentHTML("beforeend", resultdiv);
          });//Vendors Finished
        });//For Each end
    });
  }

  // Results of all cards from Landing page
  refreshLanding(param) {
    const queryValue = param
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/user/vendors?query=${queryValue}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
      .then((data) => {
        data.forEach((element)=>{
          element.vendors.forEach((vendor)=>{
            const resultdiv = piece(vendor)
            search_div.insertAdjacentHTML("beforeend", resultdiv);
          });//Vendors Finished
        });//For Each end
    });
  }

  // When user clicks category
  findcategory(event) {
    let query = event.currentTarget.innerText
    if (query === "All") {
      query = ""
    }
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/user/vendors?query=${query}`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        data.forEach((element) => {
          // Ideally, when category is selected, we would be able to see the category on top however, below code prevents result cards from showing... need to resolve, but for now, results show according to category lol
          // if (query != "") {
          //   console.log(`<div class="row><h3>${element.category}</h3></div>`)
          //   const pieceHeader = `<h3>${element.category}</h3><br>`
          //   return pieceHeader
          // }
          // search_div.insertAdjacentHTML("beforeend", pieceHeader);
          element.vendors.forEach((vendor) => {
            const resultdiv = piece(vendor)
            search_div.insertAdjacentHTML("beforeend", resultdiv);
          });//Vendors Finished
        });//For Each end
      });
  }
}// FINISH IMPORT FUNCTION

// div chunk for search result html code, reusable, vcard
const piece = (boop) => {
  const vendor = boop
  const vcard = `
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
              <a href="/user/vendors/${vendor.id}" style="text-decoration: none">
                <div class="vcard">
                  <img src="${vendor.photo_url}" alt="" class="vcardimg" />
                  <div class="vcard-content">
                    <h4>${vendor.name}</h4>
                      <div class="vcard-catcity d-flex justify-content-between">
                        <p>${vendor.category}</p>
                        <p> ${vendor.city}</p>
                      </div>
                  </div>
                </div>
              </a>
            </div>
            `
  return vcard
}
