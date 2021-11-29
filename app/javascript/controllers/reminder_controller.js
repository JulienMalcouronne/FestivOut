import { Controller } from "stimulus"

export default class extends Controller {
  activate(event) {
    this.element.classList.toggle("disabled")
    window.alert("Reminder added");
  }
  connect(
  ) {
    console.log("hello")
  }

  reminder(e) {
    window.setInterval(autoRefresh, 60000);
  }
}
