import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { friendId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "FriendChannel", id: this.friendIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribe to this friend with the id ${this.friendIdValue}.`);
  }
}
