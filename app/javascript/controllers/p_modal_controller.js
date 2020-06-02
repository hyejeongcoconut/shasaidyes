import { Controller } from "stimulus";

export default class extends Controller {
  // List the data-names that we are capturing in the targets array
  static targets = ['product_name', 'product_category', 'product_description', 'product_price', 'product'];

  setCoHostContent(data) {
    console.log("BLAA")
    console.log(data)
    this.product_nameTarget.innerHTML = data.product_name;
    this.product_categoryTarget.innerHTML = data.product_category;
    this.product_descriptionTarget.innerHTML = data.product_description;
    this.product_priceTarget.innerHTML = data.product_price;
    this.productTarget.innerHTML = data.product;   
  }

  open() {
    console.log("The modal has been opened!");
    document.body.classList.add("modal-open");
    this.element.setAttribute("style", "display: block;");
    this.element.classList.add("show");
    document.body.innerHTML += '<div class="modal-backdrop fade show"></div>';
  }

  close() {
    document.body.classList.remove("modal-open");
    this.element.removeAttribute("style");
    this.element.classList.remove("show");
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}