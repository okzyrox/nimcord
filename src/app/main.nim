import uing

proc mainApp*() =
  let window = newWindow("Hello World!", 300, 30)
  let label = newLabel("Hello, World!")

  window.child = label

  show window
  mainLoop()

init()
mainApp()