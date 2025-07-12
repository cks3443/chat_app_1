// 이 파일은 app/javascript/channels에서 모든 Active Channel을 로드합니다.
// 채널 파일이 해당 디렉토리에 추가되면 자동으로 처리됩니다.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
