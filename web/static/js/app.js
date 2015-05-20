import {Socket} from "phoenix"

let socket = new Socket("/ws")
socket.connect()

let chan = socket.chan("blogs:lobby", {})


let blogContainer = $("#blogs")


chan.on("new_blog", blog => {
  console.log("brand new blog", blog, blogContainer)
  blogContainer.append('<tr>')
  blogContainer.append(`<td>${blog.author}</td><td>${blog.title}</td><td>${blog.content}</td>`)
  blogContainer.append('<td>*cough*</td>')
  blogContainer.append('</tr>')
}
)

chan.join().receive("ok", cha => {
  console.log("Joined channel")
})



let App = {
}

export default App
