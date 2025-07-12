import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
    const conversationId = conversationElement.dataset.conversationId;

    consumer.subscriptions.create({
            channel: "ConversationChannel",
            id: conversationId
        }, {
            connected() {
                console.log("connected ");
            },
            disconnected() {
            },
            received(data) {
                const messagesContainer = document.getElementById("messages");
                if (messagesContainer) {
                    messagesContainer.insertAdjacentHTML("beforeend", data.message);
                    messagesContainer.scrollTop = messagesContainer.scrollHeight;
                }
            }
        }
    )
})