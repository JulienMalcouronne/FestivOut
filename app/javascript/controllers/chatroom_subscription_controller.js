import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data =>  {
        this.element.insertAdjacentHTML("beforeend", data);
        const messageElement = this.element.querySelector(".message:last-child");
        if (this.element.dataset.currentuser !== messageElement.dataset.senderid) {
          messageElement.classList.add("othermessage")
        }
        document.getElementById('message_content').value = "";
        this.element.scrollTo(0,this.element.scrollHeight);
      }
    }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect () {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

}
