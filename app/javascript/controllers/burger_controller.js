import { Controller } from "stimulus"

export default class extends Controller {
  activate(event) {
    this.element.classList.toggle("is-active")
  }
}
