import {Socket} from "phoenix"

let socket = new Socket("/socket", {
  params: { token: window.userToken },
  logger: (type, msg, data) => { console.log(`${type}: ${msg}`, data) }
})
export default socket
