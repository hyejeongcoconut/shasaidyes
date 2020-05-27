import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'result' ];

  refresh(event) {
    const query = document.querySelector("#search_query");
    const queryValue = query.value
    const search_div = document.querySelector("#search_div");
    search_div.innerHTML = "";
    fetch(`/vendors?query=${queryValue}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
      .then((data) => {
        console.log(data.vendors)
        data.vendors.forEach((result)=>{
          const piece = `
                <p>Name: ${result.name}, Category: ${result.category}, City: ${result.city} </p>`
          search_div.insertAdjacentHTML("beforeend", piece);
        })
    });
  }
}