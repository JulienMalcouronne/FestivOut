import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    console.log("hello")
    const url = `/`;
    const urlToUpdate = this.urlValue
    const test = navigator.geolocation.getCurrentPosition((data) => {
      console.log(data);
      const userCordinatelat = data.coords.latitude
      const userCordinatelong = data.coords.longitude
      const position = {latitude: userCordinatelat, longitude: userCordinatelong}
      const token = document.getElementsByName(
        "csrf-token"
      )[0].content;
      fetch(urlToUpdate, {
        method: "PATCH",
        headers: { "Content-Type": "application/json", "X-CSRF-Token" : token },
        body: JSON.stringify(position)
      })

          // const userCordinatelat = data.coords[4]
          // const userCordinatelong = data.coords[5]
          // console.log(userCordinatelat)
          // console.log(userCordinatelong)
    });
  }
}
