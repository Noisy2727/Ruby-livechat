import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connected to the chatroom channel!")
  },

  disconnected() {
    console.log("Disconnected from the chatroom channel.")
  },

  received(data) {
    console.log("Received data: ", data)
  }
});
