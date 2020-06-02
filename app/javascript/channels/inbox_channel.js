import consumer from "./consumer"

const initInboxCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.inboxId;

    consumer.subscriptions.create({channel: "InboxChannel", id: id }, {
      received(data) {
    messagesContainer.insertAdjacentHTML('beforeend', data);
  }
});
      }
}

  }

export { initInboxCable };

