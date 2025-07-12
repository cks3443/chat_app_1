import consumer from "./consumer"

consumer.subscriptions.create({
  channel: "ConversationChannel",
  id: getConversationId() // 대화방 ID를 가져오는 함수 호출
}, {
  connected() {
    // 연결 성공 시 실행되는 콜백
    console.log("Connected to ConversationChannel")
  },

  disconnected() {
    // 연결 종료 시 실행되는 콜백
    console.log("Disconnected from ConversationChannel")
  },

  received(data) {
    // 서버로부터 데이터를 받았을 때 실행되는 콜백
    console.log("Received data:", data)

    // 예: 메시지를 받아서 화면에 표시하는 코드
    const messagesContainer = document.querySelector('#messages')
    if (messagesContainer) {
      messagesContainer.insertAdjacentHTML('beforeend', data.html)
      messagesContainer.scrollTop = messagesContainer.scrollHeight
    }
  }
})

// 현재 URL 또는 DOM에서 대화방 ID를 추출하는 헬퍼 함수
function getConversationId() {
  // 예시: URL 파라미터에서 ID를 추출
  const pathMatch = window.location.pathname.match(/\/conversations\/(\d+)/)
  if (pathMatch) return pathMatch[1]

  // 예시: DOM 요소에서 ID를 추출
  const conversationElement = document.querySelector('[data-conversation-id]')
  if (conversationElement) return conversationElement.dataset.conversationId

  // 기본값 또는 에러 처리
  console.error("Conversation ID not found")
  return null
}
