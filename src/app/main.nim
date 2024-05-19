import uing

proc main*() =
  let main_window:Window = newWindow("Nimcord", 1200, 650)
  main_window.margined = true

  var menu = newMenu("File")

  menu.addItem("Open", proc(_: MenuItem, win: Window) =
    let filename = win.openFile()

    if filename.len == 0:
      win.error("No file selected", "Don't be alarmed!")
    else:
      win.msgBox("File selected", filename)
  )

  menu.addItem("Save", proc(_: MenuItem, win: Window) =
    let filename = win.saveFile()

    if filename.len == 0:
      win.error("No file selected", "Don't be alarmed!")
    else:
      win.msgBox("File selected (don't worry, it's still there)", filename)
  )
  
  menu.addQuitItem(
    proc(): bool =
      main_window.destroy()
      return true
  )

  menu = newMenu("Edit")
  menu.addCheckItem("Checkable Item")
  menu.addSeparator()
  disable menu.addItem("Disabled Item")
  menu.addPreferencesItem()

  menu = newMenu("Help")
  menu.addItem("Help")
  menu.addAboutItem()

  main_window.child = menu

  main_window.margined = true

  let box = newVerticalBox(true)
  main_window.child = box

  let group = newGroup("Basic Controls", true)
  box.add group

  let inner = newVerticalBox(true)
  group.child = inner

  inner.add newButton("Button", proc(_: Button) = main_window.error("Error", "Rotec"))


  show main_window
  mainLoop()

init()
