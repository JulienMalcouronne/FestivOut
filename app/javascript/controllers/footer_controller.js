import { Controller } from "stimulus"

export default class extends Controller {
  select(event) {
    this.element.classList.toggle("selected")
  }
  connect(
  ) {
    console.log("hello")
  }
}
