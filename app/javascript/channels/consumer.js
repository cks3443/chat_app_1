// Action Cable은 WebSocket 서버와의 연결을 제공합니다.
// 애플리케이션의 모든 소비자 인스턴스 간에 공유되는 WebSocket 연결을 하나만 생성할 수 있습니다.

import { createConsumer } from "@rails/actioncable"

export default createConsumer()
