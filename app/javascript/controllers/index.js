// 이 파일은 Stimulus 컨트롤러를 구성하는 엔트리 포인트입니다.
// 모든 컨트롤러를 자동으로 로드하고 등록합니다.

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// 컨트롤러를 등록합니다
const controllers = require.context(".", true, /_controller\.js$/)
controllers.keys().forEach((path) => {
  const controllerClass = controllers(path).default
  const controllerName = path
    .replace(/^\.\/|\_controller\.js$/g, "")
    .replace(/\_/g, "-")
  application.register(controllerName, controllerClass)
})

export { application }
