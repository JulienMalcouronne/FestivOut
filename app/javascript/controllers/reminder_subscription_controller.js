import { Controller } from "stimulus"

export default class extends Controller {
  static values = { reminderId: Number }
  activate(event) {
    this.element.classList.toggle("disabled")
    window.alert("Reminder added");
  }
  // connect(
  // ) {
  //   console.log("hello")
  // }



  reminder(e) {
    window.setInterval(autoRefresh, 60000);
  }
  connect () {
  this.channel = consumer.subscriptions.create(
    { friend_notification: "FriendChannel", id: this.friendIdValue },
        {
          received: data => {
            this.element.insertAdjacentHTML("beforeend", data);
            const messageElement = this.element.querySelector(".message:last-child");
            if (this.element.dataset.currentuser !== messageElement.dataset.senderid) {
              messageElement.classList.add("othermessage")
            }
            document.getElementById('message_content').value = "";
            // this.element.scrollTo(0, this.element.scrollHeight);
          }
        }
      )
console.log(`Subscribe to this friendship with the id ${this.friendIdValue}.`);
  }
}
