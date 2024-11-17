// app/javascript/channels/message_channel.js
import consumer from "./consumer"

consumer.subscriptions.create({ channel: "MessageChannel", chatroom_id: chatroomId }, {
  connected() {
    console.log("Connected to the message channel!");
  },

  disconnected() {
    console.log("Disconnected from the message channel.");
  },

  received(data) {
    // Append the new message data into the message container
    const messagesContainer = document.getElementById('messages');
    const messageHTML = `<div class="message"><strong>${data.messenger}:</strong><p>${data.body}</p></div>`;
    messagesContainer.innerHTML += messageHTML;
  }
});
