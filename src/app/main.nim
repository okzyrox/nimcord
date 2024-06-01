
import nigui, nigui/msgbox
from elements import newHyperLinkButton, newImageButton, newImageButtonWithText

app.init()

let image = newImage()
image.loadFromFile("resources/discord.64x64.png")

proc mainAreaContent*(): LayoutContainer =
  var main_area_container = newLayoutContainer(Layout_Horizontal)
  main_area_container.xAlign = XAlign_Right

  var dms_list_scroll_area = newLayoutContainer(Layout_Vertical)
  dms_list_scroll_area.maxWidth = 200
  dms_list_scroll_area.padding = 20

  var dms_label = newLabel("Direct Messages")
  dms_list_scroll_area.add(dms_label)

  for i in 0..<18:
    var button = newImageButtonWithText(i, image, "DM " & $i, 50, 50)
    
    button.width = 150
    dms_list_scroll_area.add(button)
  
  var friends_scroll_area = newLayoutContainer(Layout_Vertical)
  friends_scroll_area.maxWidth = 450
  friends_scroll_area.padding = 8

  var friends_label = newLabel("Friends")
  friends_scroll_area.add(friends_label)
  
  for i in 0..<25:
    var button = newImageButtonWithText(i, image, "Friend " & $i, 32, 32)
    button.width = 150
    friends_scroll_area.add(button)
  
  main_area_container.add(dms_list_scroll_area)
  main_area_container.add(friends_scroll_area)

  return main_area_container

proc sideAreaContent*(): LayoutContainer =
  var side_container = newLayoutContainer(Layout_Vertical)
  side_container.heightMode = HeightMode_Expand
  side_container.xAlign = XAlign_Left
  side_container.maxWidth = 100

  var button = newButton("Test1")
  side_container.add(button)

  var server_list_container = newLayoutContainer(Layout_Vertical)

  for i in 0..<45:
    var button = newImageButton(image)
    server_list_container.add(button)


  side_container.add(server_list_container)
  return side_container

proc main*() =
  var window = newWindow("Nimcord")

  window.width = 1280.scaleToDpi
  window.height = 720.scaleToDpi


  var main_container = newLayoutContainer(Layout_Horizontal)
  window.add(main_container)

  
  main_container.add(sideAreaContent())
  main_container.add(mainAreaContent())

  window.onCloseClick = proc(event: CloseClickEvent) =

    case window.msgBox("Are you sure you want to quit?", "Quit?", "Quit", "Minimize", "Cancel")
    of 1: window.dispose()
    of 2: window.minimize()
    else: discard

  window.show()
  app.run()