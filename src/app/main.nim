import uing

#import ./ui
include "ui/servers_list.nim"

proc mainApp*() =
  var mainwin: Window

  var menu = newMenu("Window")

  menu.addQuitItem(
    proc(): bool =
      mainwin.destroy()
      return true
  )

  menu = newMenu("Profile")
  disable menu.addItem("Change status")
  disable menu.addItem("Change status text...")
  menu.addSeparator()
  disable menu.addItem("Account switcher...")
  disable menu.addItem("Log out")

  menu = newMenu("Nimcord")
  menu.addItem("Issues")
  menu.addItem("Guide")
  menu.addSeparator()
  menu.addItem("About")
  #[
  menu.addItem("Issues", 
    proc(_: MenuItem, mw: Window): bool = 
      mainwin.msgBox("Issues", "https://github.com/okzyrox/nimcord/issues")
      return true
  )
  menu.addSeperator()
  menu.addItem("About", 
    proc(): bool = 
      mainwin.msgBox("About Nimcord", 
      """
      Nimcord is a experimental WIP Discord client written in Nim

      SOURCE: https://github.com/okzyrox/nimcord
      LICENSE: okzyrox-PUL

      CREDITS:
        - okzyrox
      
      """
      )
      return true
  )]#

  mainwin = newWindow("Nimcord v2", 640, 480, true)
  mainwin.margined = true

  let servers_list_box = makeServersListBox()
  mainwin.child = servers_list_box
  echo "showing window"
  show(mainwin)

  echo "starting main loop"
  mainLoop()